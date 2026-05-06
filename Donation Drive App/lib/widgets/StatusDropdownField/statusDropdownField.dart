import 'package:donation_drive/features/Controllers/QR_Controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusDropdownField extends StatelessWidget {

  final QRController controller  ;
  StatusDropdownField({super.key , required this.controller});


  @override
  Widget build(BuildContext context) {
    final dropdownListener = ValueNotifier<String?>(
      controller.selectedStatus.value.isEmpty
          ? "ALL"
          : controller.selectedStatus.value,
    );

    return Obx(() {
      dropdownListener.value =
      controller.selectedStatus.value.isEmpty
          ? "ALL"
          : controller.selectedStatus.value;

      return DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          valueListenable: dropdownListener,

          selectedItemBuilder: (context) {
            return [
              const Text(
                "All Status",
                overflow: TextOverflow.ellipsis,
              ),
              ...controller.status.map(
                    (e) => Text(
                  e,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ];
          },

          items: [
            DropdownItem<String>(
              value: "ALL",
              child: const Text(
                "All Status",
                overflow: TextOverflow.ellipsis,
              ),
            ),

            ...controller.status.map((e) {
              final isSelected =
                  controller.selectedStatus.value == e;

              return DropdownItem<String>(
                value: e,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 12),

                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFEFF6FF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                  ),

                  child: Text(
                    e,
                    maxLines: 1,
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

          onChanged: (val) {
            controller.selectedStatus.value =
            (val == "ALL") ? "" : val!;
            controller.applyFilter(reset: true);
          },

          buttonStyleData: ButtonStyleData(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE5E7EB)),
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFF3F4F6),
            ),
          ),
        ),
      );
    });
  }
}