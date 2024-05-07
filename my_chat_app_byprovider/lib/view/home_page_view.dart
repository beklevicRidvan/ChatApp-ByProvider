import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';
import '../tools/components/my_drawer.dart';
import '../tools/controller/navigator_controller.dart';
import '../view_model/home_page_view_model.dart';

class HomePageView extends StatelessWidget with NavigationController{
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      drawer:const MyDrawer(),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Home"),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.grey,
    );
  }

  _buildBody(BuildContext context) {
    return Consumer<HomePageViewModel>(builder: (context, value, child) {
      if(value.users.isNotEmpty){
        return ListView.builder(itemCount:value.users.length,itemBuilder: (context, index) {
          return _buildListItem(context,value.users[index],value);
        },);
      }
      else{
        return const Center(child: CircularProgressIndicator(color: Colors.black,),);
      }
    },);
  }

  _buildListItem(BuildContext context, UserModel user,HomePageViewModel viewModel) {
    Future.delayed(const Duration(milliseconds: 500));
    if(viewModel.currentUserId != user.uid){
      return Card(
        color: Theme.of(context).colorScheme.secondary,
        margin: const EdgeInsets.symmetric(vertical:5 ,horizontal: 25),
        child: ListTile(
          contentPadding: const EdgeInsets.all(20),
          leading: const Icon(Icons.person),
          title: Text(user.userEmail,style:  TextStyle(fontSize: 18,color: Theme.of(context).colorScheme.primary),),
          onTap: () => goMessagePage(context,user.uid,user.userEmail),
        ),
      );
    }
    else{
      return Container();
    }


  }
}
