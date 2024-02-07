import 'package:flutter/material.dart';

import '../../../model/chat_message.dart';

class MessageImage extends StatelessWidget {
  const MessageImage({
    Key? key,
    this.message,
    required this.index,
  }) : super(key: key);

  final ChatMessage? message;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.50,
      child: ClipRect(
        child: Image.network(
          message!.imageUrl!,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}