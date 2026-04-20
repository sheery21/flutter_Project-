import 'package:flutter/material.dart';

class QrSheetpage extends StatefulWidget {
  const QrSheetpage({super.key});

  @override
  State<QrSheetpage> createState() => _QrSheetpageState();
}

class _QrSheetpageState extends State<QrSheetpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Sheet"),
        centerTitle: true,
      ),
    );
  }
}
