import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:listcom/models/product/product.dart';
import 'package:uuid/uuid.dart';

class ProductService {
  //obtendo a instância do Firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference firestoreRef;
  FirebaseStorage storage = FirebaseStorage.instance;

  //método construtor
  ProductService() {
    firestoreRef = _firestore.collection('products');
  }

  //método para adicionar os dados ao FIREBASE
  Future<bool> add(
      {Product? product, dynamic imageFile, required bool plat}) async {
    final uuid = const Uuid().v1();
    try {
      final doc = await firestoreRef.add(product!.toMap());
      product.id = doc.id;
      //Persistir imagem do celular
      Reference storageRef = storage.ref().child('products').child(product.id!);
      final UploadTask task;
      if (!plat) {
        task = storageRef.child(uuid).putFile(
              imageFile,
              SettableMetadata(
                contentType: 'image/jpeg',
                customMetadata: {
                  'upload_by': 'ALBERTO SALES',
                  'description': '${product.description}'
                },
              ),
            );
      } else {
        task = storageRef.child(uuid).putData(
              imageFile,
              SettableMetadata(
                contentType: 'image/jpeg',
                customMetadata: {
                  'upload_by': 'ALBERTO SALES',
                  'description': '${product.description}',
                },
              ),
            );
      }
      final String url =
          await (await task.whenComplete(() {})).ref.getDownloadURL();
      DocumentReference docRef = firestoreRef.doc(product.id);
      await docRef.update({'image': url});
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
  Future<bool> delete(String productId) async {
    try {
      await firestoreRef.doc(productId).delete();
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
