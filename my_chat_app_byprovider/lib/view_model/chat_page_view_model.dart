import 'dart:async';

import 'package:flutter/material.dart';

import '../model/message_model.dart';
import '../repository/database_repository.dart';
import '../service/auth/auth_service.dart';
import '../tools/locator.dart';

class ChatPageViewModel with ChangeNotifier {
  final dynamic receiverID;
  final String receiverEmail;
  String? _currentUserId;
  late Stream<List<MessageModel>> _stream;
  late TextEditingController _messageController;
  FocusNode myFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  List<MessageModel> _messages = [];

  final _repository = locator<DatabaseRepository>();
  final _service = locator<AuthService>();

  ChatPageViewModel({required this.receiverID, required this.receiverEmail}) {
    _messageController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCurrentUserId();
      getMessages();
      myFocusNode.addListener(() {
        Future.delayed(
          const Duration(milliseconds: 500),
          () => scrollDown(),
        );
      });
    });
  }

  void getMessages() async {
    _stream = await _repository.getMessage(
        receiverID, _currentUserId ?? await _service.getUserId());
    _stream.listen((data) {
      _messages = data;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  void getCurrentUserId() async {
    _currentUserId = await _repository.getUserId();
    notifyListeners();
  }

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _repository.sendMessage(receiverID, _messageController.text);
      _messageController.clear();
    }
  }

  void scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  ScrollController get scrollController => _scrollController;

  List<MessageModel> get messages => _messages;

  String? get currentUserId => _currentUserId;

  TextEditingController get messageController => _messageController;
}
