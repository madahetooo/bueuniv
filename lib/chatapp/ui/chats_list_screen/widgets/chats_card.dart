import 'package:flutter/material.dart';

import '../../../model/chats_model.dart';

class ChatsCardScreen extends StatelessWidget {
  const ChatsCardScreen({
    Key? key,
    required this.chats,
    required this.press,
  }) : super(key: key);

  final Chats chats;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(chats.userImage),
                ),
                if (chats.isActive)
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3)),
                      )),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chats.name,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Opacity(
                      opacity: 0.70,
                      child: Text(
                        chats.lastMessage,
                        maxLines: 1,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.70,
              child: Text(chats.timeOfMessage),
            )
          ],
        ),
      ),
    );
  }
}
