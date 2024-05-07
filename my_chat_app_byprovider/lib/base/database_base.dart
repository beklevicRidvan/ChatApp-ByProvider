import '../model/user_model.dart';

abstract class DatabaseBase{
  Future<Stream<List<UserModel>>> getUsers();
  Future<dynamic> sendMessage(dynamic receiverKey,String message);
  Future<dynamic> getMessage(String userID,otherUserID);


}