import 'package:bue/chatapp/model/chat_message.dart';
import 'package:bue/chatapp/ui/message_screen/widgets/message_image.dart';
import 'package:bue/chatapp/ui/message_screen/widgets/message_text.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
    required this.index,
  }) : super(key: key);


  final ChatMessage message;
  final int index;
  @override
  Widget build(BuildContext context) {
    Widget messageContain(ChatMessage message, int index){
      switch(message.messageType) {
        case ChatMessageType.text:
          return MessageText(message: message);
        case ChatMessageType.image:
          return MessageImage(message: message,index: index,);
        default:
          return SizedBox();
      }
    }
    return Padding(padding: EdgeInsets.only(top: 20.0,),
      child: Container(
        child: Row(
          mainAxisAlignment: message.isSender
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            if(!message.isSender)...[
              CircleAvatar(
                child: Image.asset("assets/user_5.png"),
                radius: 18,
              ),
              SizedBox(width: 5.0,)
            ],
            messageContain(message,index),
          ],
        ),
      ),
    );
  }
}