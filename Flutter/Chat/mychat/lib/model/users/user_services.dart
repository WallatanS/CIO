import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mychat/model/users/user.dart';

class UserServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Método get para obter uma refrência do documento da coleção de usuários (users)
  DocumentReference get firestoreRef =>
      _firestore.doc('users/${userLocal!.id}');
  //variável de isntância do usuário local
  UserLocal? userLocal;

  Future<void> signUp(UserLocal userLocal) async {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: userLocal.email!, password: userLocal.password!))
        .user;
    userLocal.id = user!.uid;
    this.userLocal = userLocal;
    saveData();
  }

  Future<void> saveData() async {
    await firestoreRef.set(userLocal!.toMap());
  }
}
