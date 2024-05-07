import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureValue;
  final String hintText;
  final dynamic focusNode;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.obscureValue,
      required this.hintText,this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureValue,
        focusNode: focusNode,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color:Theme.of(context).colorScheme.primary),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.tertiary)),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary),
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
