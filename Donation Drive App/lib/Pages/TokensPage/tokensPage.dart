import 'package:flutter/material.dart';

class Tokenspage extends StatefulWidget {
  const Tokenspage({super.key});

  @override
  State<Tokenspage> createState() => _TokenspageState();
}

class _TokenspageState extends State<Tokenspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tokens"),),
    );
  }
}
