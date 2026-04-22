import 'package:donation_drive/features/Controllers/dashboard_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TokenDetailsSheet extends StatelessWidget {
  final DashboardController controller;

  const TokenDetailsSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFF8F9FA),
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Obx(() {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Token Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 6),

            Text(
              "Complete breakdown of all tokens",
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 20),

            // 🔥 GRID like image (2x2)
            GridView.builder(
              shrinkWrap: true,
              itemCount: controller.tokenDetails.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                final item = controller.tokenDetails[index];

                return Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(item["color"]),
                        Color(item["color"]).withOpacity(0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        item["icon"],
                        height: 38,
                        width: 38,
                        colorFilter: ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),

                      Spacer(),

                      Text(
                        item["title"],
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),

                      SizedBox(height: 4),

                      Text(
                        item["value"].toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            SizedBox(height: 15),

            // 🔥 extra purple card (like image)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.deepPurple],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/Icons/chartColumn1.svg"),
                  SizedBox(width: 10),
                  Text("With Details 1", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),

            SizedBox(height: 16),

            // 🔥 Close button
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text("Close", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 20),
          ],
        );
      }),
    );
  }
}
