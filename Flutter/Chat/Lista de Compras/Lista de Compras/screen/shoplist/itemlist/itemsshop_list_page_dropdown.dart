import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:listcom/models/categories/category.dart';
import 'package:listcom/models/categories/category_service.dart';
import 'package:listcom/models/item/item.dart';
import 'package:listcom/models/item/item_service.dart';
import 'package:listcom/models/product/product.dart';
import 'package:listcom/models/product/product_service.dart';
import 'package:listcom/models/shoplist/itemsshop/itemsshop_service.dart';
import 'package:listcom/screen/products/product_add_page.dart';
import 'package:listcom/screen/products/product_add_page2.dart';
import 'package:intl/intl.dart';

class ItemsShopListPage extends StatefulWidget {
  const ItemsShopListPage({
    Key? key,
    required this.idShopList,
    required this.nameList,
    required this.date,
  }) : super(key: key);

  final String nameList;
  final DateTime date;
  final String idShopList;

  @override
  State<ItemsShopListPage> createState() => _ItemsShopListPage();
}

class _ItemsShopListPage extends State<ItemsShopListPage> {
  final ItemService _itemService = ItemService();
  ItemsShopService itemsShopService = ItemsShopService();
  String categoryId = '';
  var selectedItemCategory;

  List<Item> itens = [];
  final Product _product = Product();
  String? _selection;
  @override
  void initState() {
    super.initState();
  }

  Future<List<Item>> _fetchListItems() async {
    itens = await _itemService.getItens(selectedItemCategory);
    // itens = _itemService.getFilteredItens();
    return itens;
  }

  bool? valueCB = false;

  @override
  Widget build(BuildContext context) {
    CategoryService categoryService = CategoryService();

    ProductService productService = ProductService();
    ItemsShopService itemsShopService = ItemsShopService();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Produtos à Lista"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              "Lista: ${widget.nameList} - ${DateFormat('dd-MM-yyyy').format(widget.date)}",
              style: (const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            //////////// CATEGORY DROPDOWN
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Categoria:",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: categoryService.getCategories(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      List<DropdownMenuItem<String>> categoryItems = [];
                      for (int i = 0; i < snapshot.data!.docs.length; i++) {
                        DocumentSnapshot snap = snapshot.data!.docs[i];
                        categoryItems.add(
                          DropdownMenuItem<String>(
                            value: snap.id,
                            child: Text(
                              snap.get('title'),
                              style: const TextStyle(color: Color(0xff1c313a)),
                            ),
                          ),
                        );
                      }
                      // categoryItems.sort((a, b) => a.length.compareTo(b.length));
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(width: 50.0),
                          DropdownButton(
                            // dropdownColor: const Color(0xff1c313a),
                            focusColor:
                                const Color.fromARGB(255, 249, 249, 249),
                            items: categoryItems,

                            onChanged: (value) {
                              _product.categoryId = value.toString();
                              _onTapped(value.toString());
                              final snackBar = SnackBar(
                                content: Text(
                                  'Categoria atual é $value',
                                  style: const TextStyle(color: Colors.blue),
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              setState(
                                () {
                                  selectedItemCategory = value.toString();
                                  categoryId = value.toString();
                                },
                              );
                            },
                            value: selectedItemCategory,
                            isExpanded: false,
                            hint: const Text(
                              "Escolha a categoria do produto",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 61, 80, 88)),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),

            /////////// END CATEGORY DROPDOWN

            FutureBuilder(
              future: _fetchListItems(),
              builder: (context, AsyncSnapshot snapshot) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: itens.length,
                    itemBuilder: (_, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(child: ItemList(item: itens[index])),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "fabI",
        onPressed: save,
        child: const Icon(Icons.save),
      ),
    );
  }

  _onTapped(String id) {
    categoryId = id;
  }

  /* Aqui é como você vai pegar somente os registros selecionados */
  void save() async {
    List<Item> itensMarcados = List.from(itens.where((item) => item.checked));

    for (var item in itensMarcados) {
      Product product = Product(
          id: item.id,
          name: item.name,
          description: item.description,
          categoryId: item.categoryId);
      bool ok = await itemsShopService.add(
        product,
        widget.idShopList,
      );
      if (ok && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.deepPurple,
            content: Text(
              'Produto adicionado com sucesso à lista',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      }
    }
  }
}

/* Criei aqui um widget que irá controlar o próprio estado */

class ItemList extends StatefulWidget {
  const ItemList({Key? key, this.item}) : super(key: key);

  final Item? item;

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      // tileColor: Color.fromARGB(255, 219, 229, 238),
      activeColor: Color.fromARGB(255, 17, 149, 39),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      title: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: Image.network(widget.item!.image),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(widget.item!.name)
        ],
      ),
      value: widget.item!.checked,
      onChanged: (bool? value) {
        setState(() {
          widget.item!.checked = value!;
        });
      },
    );
  }
}
