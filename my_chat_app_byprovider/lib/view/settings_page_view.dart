import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../tools/themes/theme_provider.dart';

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Settings"),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.grey,
    );
  }

  _buildBody(BuildContext context) {
    ThemeProvider viewModel = Provider.of<ThemeProvider>(context, listen: false);
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // dark mode
          const Text("Dark Mode"),

          // switch toggle
          CupertinoSwitch(
            value:
            viewModel.isDarkMode,
            onChanged: (value) {
              viewModel.toggleTheme();
            },
          )
        ],
      ),
    );
  }
}
