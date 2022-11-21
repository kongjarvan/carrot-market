import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:workspace/models/chat_message.dart';
import 'package:workspace/theme.dart';

class ChatList extends StatelessWidget {
  final ChatMessage chatMessage;
  const ChatList({required this.chatMessage, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              _profileImage(),
              SizedBox(width: 16),
              _chatInfo(),
              _chatImage(),
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey[350],
        )
      ],
    );
  }

  ClipRRect _profileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: CachedNetworkImage(
        imageUrl: '${chatMessage.profileImage}',
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, progress) => CircularProgressIndicator(
          value: progress.progress,
        ),
      ),
    );
  }

  Widget _chatImage() {
    return Visibility(
      visible: chatMessage.imageUri != null,
      child: Row(
        children: [
          SizedBox(width: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: '${chatMessage.imageUri}',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) => CircularProgressIndicator(
                value: progress.progress,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chatInfo() {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Text('${chatMessage.sender}', style: textTheme().bodyText1),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text('${chatMessage.location} • ${chatMessage.sendDate}', style: textTheme().bodyText2),
              ),
            ],
          ),
          Text(
            '${chatMessage.message}',
            style: textTheme().bodyText1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
