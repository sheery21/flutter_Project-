import 'package:flutter/material.dart';
import 'package:flutter_20_start/widgets/customAppBarFIeld/customAppBarField.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const Customappbarfield(title: "Calls", showProfileIcon: false,),
      body:Center(
        child: Container(
          width: MediaQuery.of( context).size.width,
          height: MediaQuery.of( context).size.height,
          color: Colors.green,
          child: Text("Message Page")),
      ),
    );
  }
}