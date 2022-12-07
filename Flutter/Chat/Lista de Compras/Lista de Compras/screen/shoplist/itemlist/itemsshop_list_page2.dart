import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:listcom/models/product/product.dart';
import 'package:listcom/models/product/product_service.dart';
import 'package:listcom/models/shoplist/itemsshop/itemsshop_service.dart';
import 'package:listcom/screen/products/product_add_page.dart';
import 'package:listcom/screen/products/product_add_page2.dart';
import 'package:intl/intl.dart';

class ItemsShopListPage2 extends StatefulWidget {
  const ItemsShopListPage2({
    Key? key,
    required this.idShopList,
    required this.nameList,
    required this.date,
  }) : super(key: key);

  final String nameList;
  final DateTime date;
  final String idShopList;

  @override
  State<ItemsShopListPage2> createState() => _ItemsShopListPage2();
}

class _ItemsShopListPage2 extends State<ItemsShopListPage2> {
  bool? valueCB = false;
  @override
  Widget build(BuildContext context) {
    ProductService productService = ProductService();
    ItemsShopService itemsShopService = ItemsShopService();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Produtos à Lista"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Text(
            "${widget.nameList} - ${DateFormat('dd-MM-yyyy').format(widget.date)}",
            style: (const TextStyle(
              fontSize: 20,
            )),
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: productService.firestoreRef.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              //verificar a existência de dados
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ((context, index) {
                      DocumentSnapshot docSnapshot = snapshot.data!.docs[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                          top: 10,
                        ),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: Image.network(
                                        docSnapshot['image'] ?? " ",
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return const CircularProgressIndicator(
                                            backgroundColor: Colors.cyanAccent,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.red),
                                          );
                                          //const Text('ð¢');
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 210,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            docSnapshot['name'],
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            docSnapshot['description'],
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.teal.shade100,
                                        ),
                                        onPressed: () async {
                                          // itemsShopService
                                          //     .setShopList(widget.idShopList);
                                          Product product = Product(
                                            id: docSnapshot.id,
                                            name: docSnapshot['name'],
                                            description:
                                                docSnapshot['description'],
                                          );
                                          bool ok = await itemsShopService.add(
                                            product,
                                            widget.idShopList,
                                          );
                                          if (ok && mounted) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                backgroundColor:
                                                    Colors.deepPurple,
                                                content: Text(
                                                  'Produto adicionado com sucesso à lista',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        child: const Text("Adicionar à lista")),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }
              return const Center(
                // child: Text(
                //   'Dados indisponíveis no momento',
                //   style: TextStyle(color: Colors.brown, fontSize: 20),
                // ),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.cyanAccent,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).primaryColorLight,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductAddPage2(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
