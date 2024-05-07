import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/message_model.dart';
import '../tools/components/chat_bubble.dart';
import '../tools/components/my_textfield.dart';
import '../view_model/chat_page_view_model.dart';

class ChatPageView extends StatelessWidget {
  const ChatPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(Provider.of<ChatPageViewModel>(context, listen: false)
          .receiverEmail
          .toString()),
    );
  }

  _buildBody(BuildContext context) {
    return Column(

      children: [
        // messages ListView part
        Consumer<ChatPageViewModel>(
          builder: (context, value, child) {

              return Expanded(
                child: ListView.builder(
                  controller: value.scrollController,
                  itemCount: value.messages.length,
                  itemBuilder: (context, index) {
                    return _buildListItem(context, value.messages[index]);
                  },
                ),
              );

          },
        ),
        // Input Area
        _buildMessageInputRow(context),
      ],
    );
  }

  _buildListItem(BuildContext context, MessageModel message) {
    ChatPageViewModel viewModel = Provider.of(context, listen: false);
    bool isCurrentUser = message.senderId == viewModel.currentUserId;

    var alignment =  viewModel.currentUserId != null && isCurrentUser
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      margin:const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      child: ChatBubble(message: message.message, isCurrentUser: isCurrentUser,timestamp: message.timestamp,),
    );
  }

  _buildMessageInputRow(BuildContext context) {
    ChatPageViewModel viewModel = Provider.of(context,listen: false);
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(child: MyTextField(controller: viewModel.messageController, obscureValue: false, hintText: "Send a message",focusNode: viewModel.myFocusNode,)),
          IconButton(onPressed: (){
            viewModel.sendMessage();
          }, color: Colors.green.shade800,icon: const Icon(Icons.send,size: 35,))
        ],),
    );
  }
}
