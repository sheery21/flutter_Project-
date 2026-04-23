import 'package:donation_drive/features/Controllers/QR_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Scanpage extends StatefulWidget {
  const Scanpage({super.key});

  @override
  State<Scanpage> createState() => _ScanpageState();
}

final QRController controller = Get.put(QRController());

class _ScanpageState extends State<Scanpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Scan")));
  }
}
