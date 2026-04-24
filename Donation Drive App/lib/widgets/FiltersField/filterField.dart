import 'package:donation_drive/features/Controllers/QR_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Filterfield extends StatelessWidget {
  Filterfield({super.key});

  final controller = Get.find<QRController>();
  final isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Color(0xFFE5E7EB)),
        ),
        child: Column(
          children: [
            /// HEADER
            GestureDetector(
              onTap: () => isExpanded.value = !isExpanded.value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/Icons/Vector.svg"),
                      SizedBox(width: 10),
                      Text(
                        "Filters",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    isExpanded.value
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Color(0xFF364153),
                  ),
                ],
              ),
            ),

            /// EXPAND AREA
            if (isExpanded.value) ...[
              SizedBox(height: 14),

              /// SEARCH
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF3F4F6),
                  border: Border.all(color: Color(0xFFE5E7EB)),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (val) => controller.searchText.value = val,
                  decoration: InputDecoration(
                    hintText: "Search by serial number...",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Color(0xFF99A1AF)),
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 12),

              /// DROPDOWNS
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE5E7EB)),
                        color: Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Obx(
                        () => DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            value: controller.selectedCampaign.value.isEmpty
                                ? null
                                : controller.selectedCampaign.value,
                            hint: Text("All Campaigns"),
                            items: controller.campaigns.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF364153),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Inter",
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (val) {
                              controller.selectedCampaign.value = val ?? "";
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF3F4F6),
                        border: Border.all(color: Color(0xFFE5E7EB)),
                      ),
                      child: Obx(
                        () => DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: controller.selectedStatus.value.isEmpty
                                ? null
                                : controller.selectedStatus.value,
                            hint: Text(
                              "All Status",
                              style: TextStyle(color: Colors.grey),
                            ),
                            items: controller.status.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF364153),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Inter",
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (val) {
                              controller.selectedStatus.value = val ?? "";
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 14),

              /// BUTTONS
              Row(
                children: [
                  /// APPLY BUTTON (PRIMARY)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controller.applyFilter,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF3B82F6),
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Apply Filter",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Inter",
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  /// CSV BUTTON (OUTLINE STYLE)
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.download, size: 18, color: Colors.black),
                      label: Text("CSV", style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
