import 'package:donation_drive/features/Controllers/QR_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CampaignDropdownField extends StatelessWidget {
  final QRController controller ;
  CampaignDropdownField({super.key , required this.controller});


  @override
  Widget build(BuildContext context) {
    final dropdownListener = ValueNotifier<String?>(
      controller.selectedCampaign.value.isEmpty
          ? "ALL"
          : controller.selectedCampaign.value,
    );

    return Obx(() {
      final current = controller.selectedCampaign.value;
      dropdownListener.value = current.isEmpty ? "ALL" : current;

      return DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          valueListenable: dropdownListener,

          // 🔵 UPPER SELECTED UI (NO BLUE BG HERE)
          selectedItemBuilder: (context) {
            return [
              const Text(
                "All Campaigns",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xFF364153),
                  fontWeight: FontWeight.w500,
                ),
              ),
              ...controller.campaigns.map(
                (e) => Text(
                  e,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF364153),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ];
          },

          // 🔵 DROPDOWN ITEMS (WITH HIGHLIGHT)
          items: [
            DropdownItem<String>(
              value: "ALL",
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: controller.selectedCampaign.value.isEmpty
                      ? const Color(0xFFEFF6FF)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "All Campaigns",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

            ...controller.campaigns.map((e) {
              final isSelected = controller.selectedCampaign.value == e;

              return DropdownItem<String>(
                value: e,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFEFF6FF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    e,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isSelected
                          ? const Color(0xFF3B82F6)
                          : Colors.black,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                ),
              );
            }),
          ],

          onChanged: (value) {
            controller.selectedCampaign.value =
                (value == "ALL" || value == null) ? "" : value;

            controller.applyFilter(reset: true);
          },

          // 🧱 BUTTON STYLE
          buttonStyleData: ButtonStyleData(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: controller.selectedCampaign.value.isEmpty
                    ? Colors.grey.shade300
                    : const Color(0xFF3B82F6),
              ),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),

          dropdownStyleData: DropdownStyleData(
            maxHeight: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            offset: const Offset(0, 5),
          ),
        ),
      );
    });
  }
}
