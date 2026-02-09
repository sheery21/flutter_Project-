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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center(
            //   child: Container(
            //     height: 90,
            //     width: 300,
            //     color: Colors.green,
            //     child: Center(child: Text("hello")),
            //   ),
            // ),
            // Center(
            //   child: Container(
            //     height: 90,
            //     width: 300,
            //     color: Colors.amber,
            //     child: Center(child: Text("hello")),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
