import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listcom/models/shop/items_shop.dart';

class ShopList2 {
  String? id;
  String? name;
  List<ItemsShop>? _items;

  ShopList2(this.id, this.name) {
    _items = [];
  }

  void addItem(ItemsShop items) {
    _items!.add(items);
  }

  void removeItem(ItemsShop items) {
    _items!.remove(items);
  }

  double totalPrice() {
    double total = 0;
    for (var o in _items!) {
      total += o.orderPrice!;
    }

    return total;
  }

  List<ItemsShop> get orders => _items!;

  int get itemsCount => _items!.length;

  bool get isEmpty => _items!.isEmpty;

  ShopList2.fromDocument(DocumentSnapshot doc) {
    id = doc.id;
    name = doc.get('name');
  }

  //método utilizado para enviar dados ao Firebase (conversão de informações
  //para Json) <String, dynamic> no formato de coleção do tipo Map
  //compatível com Json
  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
