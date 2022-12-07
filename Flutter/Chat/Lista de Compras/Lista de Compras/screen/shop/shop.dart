// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:shared_preferences/shared_preferences.dart';

// class Shop extends StatefulWidget {
//   @override
//   createState() => new ShopState();
// }

// class ShopState extends State<Shop> {
//   Future<SharedPreferences> _sprefs = SharedPreferences.getInstance();

//   List<String> _items = [];

//   var txt = TextEditingController();

//   void _addItem(value) {
//     setState(() {
//       _items.add(value);
//     });
//   }

//   void _editItem(index, value) {
//     setState(() {
//       _items[index] = value;
//     });
//   }

//   void _removeItem(index) {
//     setState(() {
//       _items.removeAt(index);
//     });
//   }

//   @override
//   Future<Null> getData() async {
//     final SharedPreferences prefs = await _sprefs;
//     String? data = prefs.getString('ricoshopitems');
//     this.setState(() {
// //      _items = data;
// //    todo
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Ricos Shopping List'),
//       ),
//       body: _buildList(),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         tooltip: "Add item",
//         onPressed: () {
//           // clear out txt buffer before entering new screen
//           txt.value = new TextEditingValue();
//           _pushAddItemScreen();
//         },
//       ),
//     );
//   }

//   Widget _buildList() {
//     if (_items.length < 1) {
//       return Center(
//         child: Text(
//           "Nothing to see yet...",
//           style: TextStyle(
//             fontSize: 20,
//           ),
//         ),
//       );
//     }

//     return ListView.builder(itemBuilder: (context, index) {
//       if (index < _items.length) {
//         var item = _items[index];
//         return _buildItem(item, index);
//       }
//       return null;
//     });
//   }

//   Widget _buildItem(String text, int index) {
//     return ListTile(
//       title: Text(text),
//       trailing: IconButton(
//         icon: Icon(Icons.delete),
//         onPressed: () {
//           _removeItem(index);
//         },
//       ),
//       onTap: () {
//         txt.value = new TextEditingController.fromValue(
//                 new TextEditingValue(text: _items[index]))
//             .value;
//         _pushEditItemScreen(index);
//       },
//     );
//   }

//   /// opens add new item screen
//   void _pushAddItemScreen() {
//     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Add an item'),
//         ),
//         body: TextField(
//           autofocus: true,
//           decoration: InputDecoration(
//               hintText: 'e.g. Eggs', contentPadding: EdgeInsets.all(16)),
//           controller: txt,
//           onSubmitted: (value) {
// //                    debugPrint(value);
//             // add the item
//             _addItem(value);

//             // close route
//             // when push is used, it pushes new item on stack of navigator
//             // simply pop off stack and it goes back
//             Navigator.pop(context);
//           },
//         ),
//       );
//     }));
//   }

//   /// opens edit item screen
//   void _pushEditItemScreen(index) {
//     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Edit item..'),
//         ),
//         body: TextField(
//           autofocus: true,
//           decoration: InputDecoration(
//               hintText: 'e.g. Eggs', contentPadding: EdgeInsets.all(16)),
//           controller: txt,
//           onSubmitted: (value) {
//             _editItem(index, value);

//             Navigator.pop(context);
//           },
//         ),
//       );
//     }));
//   }
// }
