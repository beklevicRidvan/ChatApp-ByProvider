import 'package:my_chat_app_byprovider/model/user_model.dart';

import '../base/auth_base.dart';
import '../base/database_base.dart';
import '../service/auth/auth_service.dart';
import '../service/cloud_firestore/firestore_service.dart';
import '../tools/locator.dart';

class DatabaseRepository implements DatabaseBase,AuthBase{

  final _fireStoreService = locator<FirestoreService>();
  final _authService = locator<AuthService>();

  @override
  Future getMessage(String userID,otherUserID) async{
    return await _fireStoreService.getMessage(userID,otherUserID);
  }

  @override
  Future<Stream<List<UserModel>>> getUsers() async{
    return await _fireStoreService.getUsers();
  }

  @override
  Future sendMessage(dynamic receiverKey,String message) async{
    await _fireStoreService.sendMessage(receiverKey,message);
  }

  @override
  Future signInWithEmailAndPassword(String email, String password, UserModel userModel) async{
   await _authService.signInWithEmailAndPassword(email, password, userModel);
  }

  @override
  Future<void> signOut() async{
    await _authService.signOut();
  }

  @override
  Future signUpWithEmailAndPassword(String email, String password, UserModel userModel) async{
   return await _authService.signUpWithEmailAndPassword(email, password, userModel);
  }

  @override
  Future<String?> getUserEmail() async{
   return await _authService.getUserEmail();
  }

  @override
  Future<String> getUserId() async{
    return await _authService.getUserId();
  }


}