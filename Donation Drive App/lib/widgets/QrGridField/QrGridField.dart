import 'package:donation_drive/Pages/QrDetailPage/QrDetailPage.dart';
import 'package:donation_drive/features/Controllers/QR_Controller.dart';
import 'package:donation_drive/widgets/QrCardField/QrCardField.dart';
import 'package:donation_drive/widgets/QrGridPagination/qrGridPagination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrGridField extends StatelessWidget {

  final QRController controller;
  QrGridField({super.key , required this.controller});

  @override
  Widget build(BuildContext context) {


    return Obx(
      () => GridView.builder(
        padding: const EdgeInsets.only(bottom: 20),
        itemCount: controller.filteredList.length,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final item = controller.filteredList[index];
          return GestureDetector(
            onTap: () {
              Get.to(() => QrDetailPage(data: item, campaign: item.campaign), );
            },
            child: QrCardField(data: item),
          );
        },
      ),
    );
  }
}
