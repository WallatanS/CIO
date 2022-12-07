import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:listcom/models/shoplist/shoplist_service.dart';
import 'package:intl/intl.dart';

class HomeShopList extends StatelessWidget {
  const HomeShopList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShopListService shopListService = ShopListService();
    DateTime? selectedDate;

    return Column(
      children: [
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
                        top: 5,
                      ),
                      child: Card(
                        color: const Color.fromARGB(255, 225, 235, 244),
                        shadowColor: const Color.fromARGB(255, 140, 190, 231),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
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
            } else if (snapshot.connectionState == ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Text("Dados não disponíveis");
            }
          },
        ),
      ],
    );
  }
}
