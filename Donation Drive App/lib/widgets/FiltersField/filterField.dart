import 'package:donation_drive/features/Controllers/QR_Controller.dart';
import 'package:donation_drive/widgets/CampaignDropdownField/campaignDropdownField.dart';
import 'package:donation_drive/widgets/StatusDropdownField/statusDropdownField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Filterfield extends StatelessWidget {
  final QRController controller;
  Filterfield({super.key, required this.controller});

  final isExpanded = false.obs;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
            child: Obx(
              () => Row(
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
                  ),
                ],
              ),
            ),
          ),

          /// EXPAND AREA
          Obx(() {
            if (!isExpanded.value) return SizedBox();

            return Column(
              children: [
                SizedBox(height: 14),

                /// SEARCH
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFF3F4F6),
                    border: Border.all(color: Color(0xFFE5E7EB)),
                  ),
                  child: TextField(
                    controller: searchController,
                    onChanged: (val) {
                      controller.searchText.value = val.trim();
                    },
                    decoration: InputDecoration(
                      hintText: "Search by serial number...",
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 0,
                      ),

                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(Icons.search, size: 20),
                      ),

                      prefixIconConstraints: BoxConstraints(
                        minWidth: 40,
                        minHeight: 40,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: CampaignDropdownField(controller: controller),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: StatusDropdownField(controller: controller),
                    ),
                  ],
                ),

                SizedBox(height: 14),

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
                        icon: Icon(
                          Icons.download,
                          size: 18,
                          color: Colors.black,
                        ),
                        label: Text(
                          "CSV",
                          style: TextStyle(color: Colors.black),
                        ),
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
            );
          }),
        ],
      ),
    );
  }
}
