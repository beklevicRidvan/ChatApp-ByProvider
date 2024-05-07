import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../tools/components/my_button.dart';
import '../../tools/components/my_textfield.dart';
import '../../view_model/auth_view_model/login_or_register_page_view_model.dart';
import '../../view_model/auth_view_model/register_page_view_model.dart';

class RegisterPageView extends StatelessWidget {
  const RegisterPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _buildBody(context),
    );
  }


  _buildBody(BuildContext context) {
    RegisterPageViewModel viewModel = Provider.of<RegisterPageViewModel>(context,listen:false);
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
            "Let's create an account for you",
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

          // confirm-password-field part
          MyTextField(controller: viewModel.confirmPwController, obscureValue: true, hintText: "Confirm password"),

          const SizedBox(height: 20,),

          // tapped-button-area part
          MyButton(
            onTap: (){
              viewModel.register(context);
            },
            text: "Register",
          ),

          const SizedBox(height: 20,),

          // register-now part
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style:
                TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                  onTap: (){
                    context.read<LoginOrRegisterPageViewModel>().togglePages( context.read<LoginOrRegisterPageViewModel>().isLoginPage);

                  },
                  child: Text(
                    " Login now",
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
