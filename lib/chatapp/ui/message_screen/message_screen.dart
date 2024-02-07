import 'package:bue/chatapp/ui/message_screen/widgets/message_body.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eslam Medhat"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call),
          ),
          SizedBox(
            width: 20,
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.logout_outlined),
          // ),
        ],
      ),
      body: MessageBody(),
    );
  }
}
