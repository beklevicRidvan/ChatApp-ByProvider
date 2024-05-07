import 'package:flutter/material.dart';
import 'package:my_chat_app_byprovider/model/user_model.dart';

import '../../repository/database_repository.dart';
import '../../tools/locator.dart';

class RegisterPageViewModel with ChangeNotifier {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPwController;

  final _repository = locator<DatabaseRepository>();

  void register(BuildContext context) async {
    try {
      if (_emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmPwController.text.isNotEmpty &&
          (_passwordController.text == _confirmPwController.text)) {
        UserModel userModel = UserModel(userEmail: _emailController.text);
        dynamic userId = await _repository.signUpWithEmailAndPassword(
            _emailController.text, _passwordController.text, userModel);
        userModel.uid = userId;
      }
    } on Exception catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.background,
            title: Text(e.toString()),
          );
        },
      );
    }
  }

  RegisterPageViewModel() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPwController = TextEditingController();
  }

  TextEditingController get confirmPwController => _confirmPwController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get emailController => _emailController;
}
