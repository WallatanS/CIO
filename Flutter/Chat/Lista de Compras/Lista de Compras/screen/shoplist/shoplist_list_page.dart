import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:listcom/models/shoplist/shoplist_service.dart';
import 'package:listcom/screen/shoplist/itemlist/itemsshop_list_page_dropdown.dart';
import 'package:listcom/screen/shoplist/shoplist_add_page.dart';
import 'package:intl/intl.dart';

class ShopListPage extends StatelessWidget {
  const ShopListPage({super.key});

  @override
  Widget build(BuildContext context) {
    ShopListService shopListService = ShopListService();
    DateTime? selectedDate;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listas de Compras"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          StreamBuilder(
            stream: shopListService.firestoreRef.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              //verificar a existência de dados
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ((context, index) {
                      DocumentSnapshot docSnapshot = snapshot.data!.docs[index];
                      selectedDate = (docSnapshot['date'].toDate());
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                          top: 10,
                        ),
                        child: Card(
                          elevation: 1,
                          color: const Color.fromARGB(255, 225, 235, 244),
                          shadowColor: const Color.fromARGB(255, 140, 190, 231),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, top: 5, bottom: 5),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 180,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        docSnapshot['name'],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        //internaticionalização intl.dart
                                        DateFormat('dd-MM-yyyy')
                                            .format(selectedDate!),
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  iconSize: 18,
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  iconSize: 18,
                                  onPressed: () async {
                                    bool ok = await shopListService
                                        .delete(docSnapshot.id);
                                    if (ok) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Produto deletado com sucesso.'),
                                        ),
                                      );
                                    }
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                                SizedBox(
                                  width: 140,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 240, 226, 209), // Text Color
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ItemsShopListPage(
                                            idShopList: docSnapshot.id,
                                            nameList: docSnapshot['name'],
                                            date: selectedDate!,
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Adicionar Produtos",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Text("Dados não disponíveis");
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'fbs',
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).primaryColorLight,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ShopListAddPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
