import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../tools/components/my_button.dart';
import '../../tools/components/my_textfield.dart';
import '../../view_model/auth_view_model/login_or_register_page_view_model.dart';
import '../../view_model/auth_view_model/login_page_view_model.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    LoginPageViewModel viewModel = Provider.of<LoginPageViewModel>(context,listen:false);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo part
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 50,),
          Text(
            "Welcome back,yo've been missed!",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 16),
          ),
          const SizedBox(height: 20,),

          // email-field part
          MyTextField(controller: viewModel.emailController, obscureValue: false, hintText: "Enter your email"),

          const SizedBox(height: 20,),

          // password-field part
          MyTextField(controller: viewModel.passwordController, obscureValue: true, hintText: "Enter your password"),

          const SizedBox(height: 20,),

          // tapped-button-area part

          MyButton(
            onTap: (){
              viewModel.login(context);
            },
            text: "Login",
          ),

          const SizedBox(height: 20,),

          // register-now part
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not a member?",
                style:
                TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                  onTap: (){
                    context.read<LoginOrRegisterPageViewModel>().togglePages( context.read<LoginOrRegisterPageViewModel>().isLoginPage);
                  },
                  child: Text(
                    " Register now",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary),
                  )),
            ],
          )


        ],
      ),
    );
  }
}
