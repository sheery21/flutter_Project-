import 'package:donation_drive/features/Controllers/QR_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageHeaderField extends StatelessWidget {
  PageHeaderField({super.key});

  final QRController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int total = controller.qrList.length;
      int current = controller.filteredList.length;

      return Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text("Showing $current of $total"),
          ),
          const Spacer(),
          GestureDetector(
            onTap: controller.loadMore,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF1E5EFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Text("Next", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 6),
                  Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
