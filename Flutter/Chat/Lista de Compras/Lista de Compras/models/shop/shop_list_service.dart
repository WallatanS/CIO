// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:listcom/models/shop/shop_list.dart';

// class ShopListService{

//     //obtendo a instância do Firebase
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   late CollectionReference firestoreRef;

//   //método construtor
//   ShopListService() {
//     firestoreRef = _firestore.collection('shoplist');
//   }

//   //método para adicionar os dados ao FIREBASE
//   Future<bool> add(ShopList shopList) async {
//     try {
//       await firestoreRef.add(shopList.toMap());
//       shopList.id = doc.id;
//       Reference storageRef = storage.ref().child('products').child(shopList.id!);
//       final UploadTask task;
//       if (!plat) {
//         task = storageRef.child(uuid).putFile(
//               imageFile,
//               SettableMetadata(contentType: 'image/jpeg', customMetadata: {
//                 'uploaded_by': '${shopList.name}',
//                 'description': '${shopList.description}'
//               }),
//             );
//       } else {
//         // final metadata = SettableMetadata(contentType: "image/jpeg");
//         task = storageRef.child(uuid).putData(
//               imageFile,
//               SettableMetadata(contentType: 'image/jpeg', customMetadata: {
//                 'uploaded_by': '${shopList.name}',
//                 'description': '${shopList.description}'
//               }),
//             );
//       }
//       final String url =
//           await (await task.whenComplete(() {})).ref.getDownloadURL();
//       DocumentReference docRef = firestoreRef.doc(shopList.id);
//       await docRef.update({'image': url});
//       // firestoreRef.doc(product.id).set('image');
//       // product.image = url;
//       // product.id = _uuid;
//       // final doc = await firestoreRef.add(product.toMap());
//       //  product.id = doc.id;
//       return Future.value(true);
//     } on FirebaseException catch (e) {
//       if (e.code != 'OK') {
//         debugPrint('Problemas ao gravar dados');
//       } else if (e.code == 'ABORTED') {
//         debugPrint('Inclusão de dados abortada');
//       }
//       return Future.value(false);
//     }
//   }

//   //método para deletar produto
//   Future<bool> delete(String productId) async {
//     try {
//       await firestoreRef.doc(productId).delete();
//       return Future.value(true);
//     } on FirebaseException catch (e) {
//       if (e.code != 'OK') {
//         debugPrint('Problemas ao deletar dados');
//       } else if (e.code == 'ABORTED') {
//         debugPrint('Deleção abortada');
//       }
//       return Future.value(false);
//     }
//   }
// }