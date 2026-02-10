import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_20_start/services/chat_service.dart';
import 'package:flutter_20_start/widgets/chatHeaderField/chatHeaderField.dart';

class Chatpage extends StatefulWidget {
  final String chatId;
  final String receiverId;

  const Chatpage({super.key, required this.chatId, required this.receiverId});
  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  final TextEditingController messageController = TextEditingController();
  final ChatService chatService  = ChatService();

  final String currentUserId = "USER_123";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatHeader(),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
