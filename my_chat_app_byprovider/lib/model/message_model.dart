import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  dynamic receiverId;
  dynamic senderId;
  String senderEmail;
  String message;
  Timestamp timestamp = Timestamp.now();

  MessageModel(
      {this.receiverId,
      this.senderId,
      required this.senderEmail,
      required this.message});

  factory MessageModel.fromMap(Map<String, dynamic> map,
      {dynamic receiverKey, dynamic senderKey}) {
    return MessageModel(
        receiverId: receiverKey ?? map["receiverID"],
        senderId: senderKey ?? map["senderID"],
        senderEmail: map["senderEmail"],
        message: map["message"]);
  }


  Map<String,dynamic> toMap({dynamic receiverKey,dynamic senderKey}){
    return {
      "receiverID":receiverKey ?? receiverId,
      "senderID":senderKey ?? senderId,
      "senderEmail":senderEmail,
      "timestamp":timestamp,
      "message":message
    };
  }
}
