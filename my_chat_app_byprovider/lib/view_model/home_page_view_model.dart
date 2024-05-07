import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../repository/database_repository.dart';
import '../tools/locator.dart';

class HomePageViewModel with ChangeNotifier{

  late Stream<List<UserModel>> _stream;
  List<UserModel> _users = [];
   late String _currentUserId;


  final _repository = locator<DatabaseRepository>();


  void logOut()async{
    await _repository.signOut();
  }


  HomePageViewModel(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getUserData();
      getCurrentUserId();
    });
  }

  void getUserData()async{
    _stream = await _repository.getUsers();
    _stream.listen((data) {
      _users = data;
      notifyListeners();
    });
  }

  void getCurrentUserId() async {
    _currentUserId = await _repository.getUserId();
    notifyListeners();
  }


  String get currentUserId => _currentUserId;


  List<UserModel> get users => _users;
}