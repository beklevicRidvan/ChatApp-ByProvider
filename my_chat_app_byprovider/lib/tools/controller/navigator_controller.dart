import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view/chat_page_view.dart';
import '../../view/settings_page_view.dart';
import '../../view_model/chat_page_view_model.dart';

mixin NavigationController on StatelessWidget{


  void goToSettingsPage(BuildContext context){
    MaterialPageRoute pageRoute = MaterialPageRoute(builder: (context) {
      return const SettingsPageView();
    },);

    Navigator.push(context,pageRoute);
  }

  void goMessagePage(BuildContext context,dynamic receiverId,String email){
    MaterialPageRoute pageRoute = MaterialPageRoute(builder:(context) =>  ChangeNotifierProvider(create: (context) => ChatPageViewModel(receiverID: receiverId,receiverEmail: email),child:const ChatPageView(),));
    Navigator.push(context, pageRoute);
  }



}