import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_chat_app_byprovider/model/message_model.dart';
import 'package:my_chat_app_byprovider/model/user_model.dart';

import '../database_service.dart';

class FirestoreService extends DatabaseBaseService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Future getMessage(String userID,otherUserID) async {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomId = ids.join("_");
    return  _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots().map((snapshots) => snapshots.docs.map((docs) => MessageModel.fromMap(docs.data())).toList());
  }



  @override
  Future<Stream<List<UserModel>>> getUsers() async {
    return _firestore.collection("Users").snapshots().map((snapshots) =>
        snapshots.docs
            .map((e) => UserModel.fromMap(uidKey: e.id, e.data()))
            .toList());
  }

  @override
  Future sendMessage(dynamic receiverKey, String message) async {
    var senderEmail = _auth.currentUser!.email;
    var senderId = _auth.currentUser!.uid;

    List<String> ids = [senderId, receiverKey];
    ids.sort();
    String chatRoomId = ids.join("_");

    MessageModel messageObject = MessageModel(
        receiverId: receiverKey,
        senderEmail: senderEmail ?? "static@gmail.com",
        message: message,
        senderId: senderId);

    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .add(
            messageObject.toMap(senderKey: senderId, receiverKey: receiverKey));
  }
}
