import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_chat_app_byprovider/model/user_model.dart';

import '../auth_base_service.dart';

class AuthService extends AuthBaseService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future signInWithEmailAndPassword(
      String email, String password, UserModel userModel) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      await _firestore
          .collection("Users")
          .doc(user.user!.uid)
          .set(userModel.toMap(uidKey: user.user!.uid));

      return user.user!.uid;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future signUpWithEmailAndPassword(
      String email, String password, UserModel userModel) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await _firestore
          .collection("Users")
          .doc(user.user!.uid)
          .set(userModel.toMap(uidKey: user.user!.uid));

      return user.user!.uid;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  @override
  Future<String?> getUserEmail() async{
    return  _auth.currentUser!.email;
  }

  @override
  Future<String> getUserId() async{
    return _auth.currentUser!.uid;
  }


}
