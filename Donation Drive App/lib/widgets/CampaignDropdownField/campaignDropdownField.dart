import 'package:donation_drive/features/Controllers/QR_Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampaignDropdownField extends StatelessWidget {
  CampaignDropdownField({super.key});

  final QRController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: controller.selectedCampaign.value.isEmpty
                ? null
                : controller.selectedCampaign.value,
            hint: Text("All campaigns"),
            isExpanded: true,
            items: controller.campaigns.map((campaign) {
              return DropdownMenuItem(value: campaign, child: Text(campaign));
            }).toList(),
            onChanged: (value) {
              controller.selectedCampaign.value = value ?? "";
              controller.applyFilter(reset: true);
            },
          ),
        ),
      ),
    );
  }
}
