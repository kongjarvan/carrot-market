import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace/models/chat_message.dart';
import 'package:workspace/view/pages/main/chatting/components/chat_list.dart';

class ChattingPage extends StatelessWidget {
  const ChattingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('채팅'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search)),
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.plus_rectangle_on_rectangle)),
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bell)),
        ],
        elevation: 1.0,
      ),
      body: ListView(
        children: [
          ...List.generate(
            chatMessageList.length,
            (index) => ChatList(chatMessage: chatMessageList[index]),
          ),
        ],
      ),
    );
  }
}
