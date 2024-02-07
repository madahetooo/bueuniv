import 'package:flutter/cupertino.dart';

enum ChatMessageType { text, image, audio, video }

enum ChatMessageStatus { not_sent, not_viewed, viewed }

class ChatMessage {
  final String text;
  final ChatMessageType messageType;
  final ChatMessageStatus messageStatus;
  final bool isSender;
  final String? sender;
  final String? senderImage;
  final String? imageUrl;

  ChatMessage(
      {this.text = "",
      required this.messageType,
      required this.messageStatus,
      required this.isSender,
      this.sender,
      this.senderImage,
      this.imageUrl});
}

class ChatMessages with ChangeNotifier {
  List<ChatMessage> chatMessages = [
    ChatMessage(
        text: "Hi Ahmed",
        messageType: ChatMessageType.text,
        messageStatus: ChatMessageStatus.viewed,
        isSender: false),
    ChatMessage(
        text: "Hi Kareem, How are you ",
        messageType: ChatMessageType.text,
        messageStatus: ChatMessageStatus.viewed,
        isSender: true),
    ChatMessage(
        text: "I am good alhamdullilah",
        messageType: ChatMessageType.text,
        messageStatus: ChatMessageStatus.viewed,
        isSender: false),
    ChatMessage(
        text: "Happy to hear that",
        messageType: ChatMessageType.text,
        messageStatus: ChatMessageStatus.viewed,
        isSender: true),
    ChatMessage(
        text: "Do you hane any updates ? ",
        messageType: ChatMessageType.text,
        messageStatus: ChatMessageStatus.viewed,
        isSender: false),
    ChatMessage(
        text: "No , i dont have",
        messageType: ChatMessageType.text,
        messageStatus: ChatMessageStatus.viewed,
        isSender: true),
  ];

  void addMessage(ChatMessage message){
    chatMessages.add(message);
    notifyListeners();
  }
  List<ChatMessage> get getMessageList => chatMessages;
}
