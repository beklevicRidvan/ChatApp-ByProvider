import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/home_page_view_model.dart';
import '../controller/navigator_controller.dart';

class MyDrawer extends StatelessWidget with NavigationController{
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageViewModel viewModel = Provider.of(context,listen:false);
    return Drawer(

      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // logo
          Column(
            children: [
              DrawerHeader(
                  child: Center(
                child: Icon(
                  Icons.message,
                  color: Theme.of(context).colorScheme.primary,
                  size: 40,
                ),
              )),

              // home list tile
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: const Text(
                    "H O M E",
                  ),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              // settings list tile

              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: const Text("S E T T I N G S"),
                  leading: const Icon(Icons.settings),
                  onTap: () {
                    goToSettingsPage(context);
                  },
                ),
              ),
            ],
          ),

          // logout list tile

          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.logout),
              onTap: () {
                viewModel.logOut();
              },
            ),
          ),
        ],
      ),
    );
  }
}
