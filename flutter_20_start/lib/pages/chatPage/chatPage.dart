import 'package:flutter/material.dart';
import 'package:flutter_20_start/widgets/chatHeaderField/chatHeaderField.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatHeader(),
      body: Container(),
    );
  }
}