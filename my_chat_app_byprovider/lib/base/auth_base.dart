import '../model/user_model.dart';

abstract class AuthBase {
  Future<dynamic> signInWithEmailAndPassword(String email, String password, UserModel userModel);
  Future<void> signOut();
  Future<dynamic> signUpWithEmailAndPassword(String email, String password, UserModel userModel);
  Future<String?> getUserEmail();
  Future<String> getUserId();
}
