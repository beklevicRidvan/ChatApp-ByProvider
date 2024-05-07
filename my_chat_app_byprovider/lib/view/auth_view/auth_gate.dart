import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app_byprovider/view/auth_view/login_or_register_page.dart';
import 'package:my_chat_app_byprovider/view/home_page_view.dart';


class AuthGateView extends StatelessWidget {
  const AuthGateView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() {
   return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot) {
     if(snapshot.hasData){
       return const HomePageView();
     }
     else{
       return const LoginOrRegisterPageView();
     }
   },);
  }
}
