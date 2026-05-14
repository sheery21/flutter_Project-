import 'package:donation_drive/features/Controllers/QR_Controller.dart';
import 'package:donation_drive/features/Controllers/QrSheetController/qrSheetController.dart';
import 'package:donation_drive/widgets/CampaignDropdownField/campaignDropdownField.dart';
import 'package:donation_drive/widgets/PageHeaderField/pageHeaderField.dart';
import 'package:donation_drive/widgets/QrGridField/QrGridField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrSheetpage extends StatelessWidget {
  QrSheetpage({super.key});

  final QrSheetController controller = Get.put(QrSheetController());

  @override
  Widget build(BuildContext context) {
    controller.isPaginationMode = true;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: const Color(0xFFFAFAF9),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    PageHeaderField(controller: controller),
                    SizedBox(height: 12),
                    CampaignDropdownField(controller: controller),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
                top: 10.0,
              ),
              child: QrGridField(controller: controller),
            ),
          ],
        ),
      ),
    );
  }
}
