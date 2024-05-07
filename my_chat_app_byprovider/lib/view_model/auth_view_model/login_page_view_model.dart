import 'package:flutter/material.dart';
import 'package:my_chat_app_byprovider/model/user_model.dart';

import '../../repository/database_repository.dart';
import '../../tools/locator.dart';

class LoginPageViewModel with ChangeNotifier {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  final _repository = locator<DatabaseRepository>();

  LoginPageViewModel() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void login(BuildContext context) async {
    try {
      UserModel userModel = UserModel(userEmail: _emailController.text);
      dynamic userId = await _repository.signInWithEmailAndPassword(
          _emailController.text, _passwordController.text, userModel);
      userModel.uid = userId;
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(e.toString()),
        ),
      );
    }
  }

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;
}
