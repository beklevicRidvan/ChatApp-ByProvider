import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'tools/locator.dart';
import 'tools/themes/light_mode.dart';
import 'tools/themes/theme_provider.dart';
import 'view/auth_view/auth_gate.dart';
import 'view_model/auth_view_model/login_or_register_page_view_model.dart';
import 'view_model/auth_view_model/login_page_view_model.dart';
import 'view_model/auth_view_model/register_page_view_model.dart';
import 'view_model/home_page_view_model.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  setupLocator();
  runApp(ChangeNotifierProvider(create: (context) => ThemeProvider(),child: const MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeProvider>().themeData,
      home:MultiProvider(providers: [
        ChangeNotifierProvider(create:(context) =>  LoginPageViewModel()),
        ChangeNotifierProvider(create: (context) => RegisterPageViewModel()),
        ChangeNotifierProvider(create:(context) =>  LoginOrRegisterPageViewModel()),
        ChangeNotifierProvider(create: (context) => HomePageViewModel(),),


      ],child: const AuthGateView(),),
    );
  }
}
