import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:listcom/models/shoplist/shoplist.dart';

class ShopListService {
  //obtendo a instância do Firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  late CollectionReference firestoreRef;

  //método construtor
  ShopListService() {
    firestoreRef = _firestore.collection('shoplist');
  }

  //método para adicionar os dados ao FIREBASE
  Future<bool> add(ShopList shopList) async {
    try {
      final doc = await firestoreRef.add(shopList.toMap());
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
  Future<bool> delete(String shopListId) async {
    try {
      await firestoreRef.doc(shopListId).delete();
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
}
