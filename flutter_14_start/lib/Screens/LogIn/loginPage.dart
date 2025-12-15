import 'package:flutter/material.dart';
import 'package:flutter_14_start/Widgets/TextField/textField.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          
        ),
        child: Column(children: [

        ],),
      ),
    );
  }
}
