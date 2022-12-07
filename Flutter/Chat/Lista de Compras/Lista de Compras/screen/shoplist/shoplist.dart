import 'package:flutter/material.dart';
import 'package:listcom/models/item/item.dart';
import 'package:listcom/models/item/item_service.dart';
import 'package:listcom/models/product/product_service.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class ShopList extends StatefulWidget {
  const ShopList({super.key});

  @override
  State<ShopList> createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  final ItemService _itemService = ItemService();
  /* Uma lista que você irá implementar com os dados dos nomes vindo do firebase 
    Alimente ela dentro do seu StreamBuilder
  */

  List<Item> itens = [];
  String? categoryId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _itemService.getItens();
    // widget.itens = widget._itemService.itens;
    // debugPrint("init -->}");
  }

  Future<List<Item>> _fetchListItems() async {
    itens = await _itemService.getItens(categoryId!);
    // itens = _itemService.getFilteredItens();
    return itens;
  }

  // final List<Item> itens = [
  @override
  Widget build(BuildContext context) {
    debugPrint("Items ${itens.length}");
    return Scaffold(
      body: FutureBuilder(
        future: _fetchListItems(),
        builder: (context, AsyncSnapshot snapshot) {
          return ListView.builder(
            itemCount: itens.length,
            itemBuilder: (_, int index) {
              return ItemLista(item: itens[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "fabI",
        onPressed: salvar,
        child: const Icon(Icons.save),
      ),
    );
  }

  /* Aqui é como você vai pegar os registros selecionados apenas */
  void salvar() {
    List<Item> itensMarcados = List.from(itens.where((item) => item.checked));

    for (var item in itensMarcados) {
      debugPrint(item.name);
    }
  }
}

/* Criei aqui um widget que irá controlar o próprio estado */

class ItemLista extends StatefulWidget {
  const ItemLista({Key? key, this.item}) : super(key: key);

  final Item? item;

  @override
  _ItemListaState createState() => _ItemListaState();
}

class _ItemListaState extends State<ItemLista> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
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
