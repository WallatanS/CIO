import 'package:cloud_firestore/cloud_firestore.dart';

class ShopList {
  String? id;
  String? name;
  DateTime? date;
  ShopList({
    this.id,
    this.name,
    this.date,
  });

  //Método utilizado para armazenar dados do documento obtido do Firebase
  ShopList.fromDocument(DocumentSnapshot doc) {
    id = doc.id;
    name = doc.get('name');
    date = (doc.get('datetime') as Timestamp).toDate();
  }

  //método utilizado para enviar dados ao Firebase (conversão de informações
  //para Json) <String, dynamic> no formato de coleção do tipo Map
  //compatível com Json
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date': date,
    };
  }
}
