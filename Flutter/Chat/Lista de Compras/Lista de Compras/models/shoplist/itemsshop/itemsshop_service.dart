import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:listcom/models/product/product.dart';

class ItemsShopService {
  String? shopListId;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // late CollectionReference firestoreRef;
  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('shoplist/$shopListId');

  // DocumentReference get firestoreRef => FirebaseFirestore.instance.doc('users/$id');

  // CollectionReference get cartReference => firestoreRef.collection('cart');

  //método para adicionar os dados ao FIREBASE
  Future<bool> add(Product product, String shopListId) async {
    try {
      await _firestore
          .collection('shoplist')
          .doc(shopListId)
          .collection('items')
          .doc(product
              .id) //determina o id do item incluído com o mesmo do produto
          .set(product.toMap()); //.add vai incluir novo documento
      // final doc = await firestoreRef.collection('items').add(product.toMap());
      return Future.value(true);
    } on FirebaseException catch (e) {
      if (e.code != 'OK') {
        debugPrint('Problemas ao gravar dados');
      } else if (e.code == 'ABORTED') {
        debugPrint('Inclusão de dados abortada');
      }
      return Future.value(false);
    }
  }

  //método para deletar produto
  Future<bool> delete(String itemshopListId) async {
    try {
      await firestoreRef.collection('items').doc(itemshopListId).delete();
      return Future.value(true);
    } on FirebaseException catch (e) {
      if (e.code != 'OK') {
        debugPrint('Problemas ao deletar dados');
      } else if (e.code == 'ABORTED') {
        debugPrint('Deleção abortada');
      }
      return Future.value(false);
    }
  }

  void setShopList(String? shopListId) {
    this.shopListId = shopListId;
  }
}
