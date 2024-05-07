import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants_method.dart';
import '../themes/theme_provider.dart';

class ChatBubble extends StatelessWidget with ConstantsMethod {
  final String message;
  final bool isCurrentUser;
  final Timestamp timestamp;
  const ChatBubble(
      {super.key,
      required this.message,
      required this.isCurrentUser,
      required this.timestamp});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isCurrentUser
                ? (isDarkMode ? Colors.green.shade600 : Colors.grey.shade500)
                : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200),
          ),
          child: Text(
            message,
            style: TextStyle(
                color: isCurrentUser
                    ? Colors.white
                    : (isDarkMode ? Colors.white : Colors.black)),
          ),
        ),
        Positioned(
            right: isCurrentUser ? null : 30,
            bottom: 5,
            left: isCurrentUser ? 30 : null,
            child: Text(
              formatTimestamp(timestamp),
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
