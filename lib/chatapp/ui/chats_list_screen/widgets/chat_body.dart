import 'package:bue/chatapp/ui/chats_list_screen/widgets/chats_card.dart';
import 'package:bue/chatapp/ui/chats_list_screen/widgets/filled_outline_button.dart';
import 'package:bue/chatapp/ui/message_screen/message_screen.dart';
import 'package:flutter/material.dart';

import '../../../model/chats_model.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 60,
            padding: const EdgeInsets.all(10),
            color: Colors.redAccent,
            child: Row(
              children: [
                FilledOutlinedButton(
                    press: () {}, text: "Active", isFilled: false),
                SizedBox(
                  width: 10,
                ),
                FilledOutlinedButton(
                    press: () {}, text: "Recent Messages", isFilled: true),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: chatsData.length,
                  itemBuilder: (context, index) => ChatsCardScreen(
                      chats: chatsData[index],
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MessageScreen()));
                      })))
        ],
      ),
    );
  }
}
