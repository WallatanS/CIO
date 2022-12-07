import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:listcom/models/product/product_service.dart';
import 'package:listcom/screen/products/product_add_page.dart';
import 'package:listcom/screen/products/product_add_page2.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    ProductService productService = ProductService();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listagem de Produtos"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
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
                                    // SizedBox(
                                    //   height: 50,
                                    //   width: 50,
                                    //   child: AspectRatio(
                                    //     aspectRatio: 1,
                                    //     //first determina a apresentação da primeira imagem do array
                                    //     child:
                                    //         Image.network(docSnapshot['image']),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 80,
                                      width: 80,
                                      // child: Image.network(cartProduct.product.images.first),
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
                                      width: 216,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 18.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              docSnapshot['name'],
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'R\$ ${docSnapshot['price'].toString()}',
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
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
                                        bool ok = await productService
                                            .delete(docSnapshot.id);
                                        if (ok && mounted) {
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
                                    )
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
        heroTag: 'fbp',
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
