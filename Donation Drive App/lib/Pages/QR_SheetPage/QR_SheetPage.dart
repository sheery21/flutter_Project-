import 'package:donation_drive/features/Controllers/QR_Controller.dart';
import 'package:donation_drive/widgets/CampaignDropdownField/campaignDropdownField.dart';
import 'package:donation_drive/widgets/PageHeaderField/pageHeaderField.dart';
import 'package:donation_drive/widgets/QrCardField/QrCardField.dart';
import 'package:donation_drive/widgets/QrGridField/QrGridField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrSheetpage extends StatelessWidget {
  QrSheetpage({super.key});

  final QRController controller = Get.put(QRController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QR Sheet"), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              PageHeaderField(),
              SizedBox(height: 12),
              CampaignDropdownField(),
              SizedBox(height: 12),
              QrGridField(),
            ],
          ),
        ),
      ),
    );
  }
}
