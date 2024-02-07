import 'package:bue/chatapp/ui/chats_list_screen/widgets/chat_body.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Friends"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: changeIndex,
        items: [
          const BottomNavigationBarItem(label: "Chats", icon: Icon(Icons.chat)),
          const BottomNavigationBarItem(label: "People", icon: Icon(Icons.people)),
          const BottomNavigationBarItem(label: "Call", icon: Icon(Icons.call)),
          const BottomNavigationBarItem(
              label: "Profile",
              icon: CircleAvatar(
                backgroundImage: AssetImage("assets/images/user_5.png"),
              )),
        ],
      ),
      body: ChatBody(),
    );
  }

  void changeIndex(int value){
    setState(() {
      currentIndex = value;
    });
  }
}

// Widget buildAppBar() {
//   return AppBar(
//     title: Text("Friends"),
//     actions: [
//       IconButton(
//         onPressed: () {},
//         icon: Icon(Icons.search),
//       ),
//     ],
//   );
// }
