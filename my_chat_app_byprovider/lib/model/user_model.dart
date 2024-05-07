class UserModel{
  dynamic uid;
  String userEmail;

  UserModel({this.uid,required this.userEmail});



  factory UserModel.fromMap(Map<String,dynamic>map,{dynamic uidKey}){
    return UserModel(uid: uidKey ?? map["uid"],userEmail: map["email"]);
  }


  Map<String,dynamic> toMap({dynamic uidKey}){
    return {
      "uid": uidKey ?? uid,
      "email":userEmail
    };
  }



}