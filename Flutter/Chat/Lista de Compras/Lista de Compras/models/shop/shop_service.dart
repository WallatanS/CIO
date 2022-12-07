import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listcom/models/product/product.dart';
import 'package:listcom/models/shop/items_shop.dart';
import 'package:listcom/models/shop/shop_list.dart';

class ShopService {
  static int _orderId = 0;
  ShopList2? _shopList;
  ItemsShop? _item;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference firestoreRef;

  //método construtor
  ShopService() {
    firestoreRef = _firestore.collection('shoplist');
  }
  void addItemToShopList(Product product, int quantity) {
    _item = ItemsShop(product, quantity, _orderId++);
    _shopList!.addItem(_item!);
    // _updateLastOrder();
    // _updateCart();
  }

  void saveShopList() async {
    // Map<String, dynamic> user1 = {"firstName": "Jane", "lastName": "Smith"};
    // Map<String, dynamic> user2 = {"firstName": "John", "lastName": "Doe"};
    // Map<String, dynamic> user3 = {"firstName": "Foo", "lastName": "Bar"};
    final doc = await firestoreRef.add(_shopList!.toMap());

    // _firestore
    //     .collection('shoplist')
    //     .doc('test1')
    //     .update({
    //       'array1': FieldValue.arrayUnion([user3])
    //     })
    //     .then((value) => print("Updated"))
    //     .catchError((error) => print("Failed"));
  }

  // void removerOrderOfCart(Order order){
  //   _currentList.removeOrder(order);
  //   _updateCart();
  // }

  // Cart get currentCart => _currentList;

  Map<String, dynamic> itemShop(String amount, String type) {
    var amountDouble = double.parse(amount);
    if (type == "spent") {
      amountDouble = double.parse("-" + amount);
    }
    return {
      'ledger': FieldValue.arrayUnion([
        {
          "date": DateTime.now(),
          "amount": amountDouble,
        },
      ]),
      'saved': FieldValue.increment(amountDouble)
    };
  }
}

//Adding new array of maps

// Map<String, dynamic> user1 = {"firstName": "Jane", "lastName": "Smith"};
// Map<String, dynamic> user2 = {"firstName": "John", "lastName": "Doe"};

// FirebaseFirestore firestore = FirebaseFirestore.instance;
// firestore
//   .collection('testMapArray')
//   .doc('test1')
//   .update({
//     'array1': [user1, user2]
//   })
//   .then((value) => print("Updated"))
//   .catchError((error) => print("Failed"));

  //ATUALIZANDO ARRAY



  // Map<String, dynamic> user1 = {"firstName": "Jane", "lastName": "Smith"};
  // Map<String, dynamic> user2 = {"firstName": "John", "lastName": "Doe"};
  // Map<String, dynamic> user3 = {"firstName": "Foo", "lastName": "Bar"};

  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // firestore
  //     .collection('testMapArray')
  //     .doc('test1')
  //     .update({
  //       'array1': FieldValue.arrayUnion([user3])
  //     })
  //     .then((value) => print("Updated"))
  //     .catchError((error) => print("Failed"));