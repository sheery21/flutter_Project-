import 'package:donation_drive/features/Controllers/QR_Controller.dart';
import 'package:donation_drive/widgets/QrCardField/QrCardField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrGridField extends StatelessWidget {
  QrGridField({super.key});

  final QRController controller = Get.find();

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
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          final item = controller.filteredList[index];
          return QrCardField(data: item);
        },
      ),
    );
  }
}
