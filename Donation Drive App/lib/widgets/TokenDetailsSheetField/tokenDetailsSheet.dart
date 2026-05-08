import 'package:donation_drive/features/Controllers/dashboard_controller.dart';
import 'package:donation_drive/widgets/ButtonsField/buttonField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TokenDetailsSheet extends StatelessWidget {
  final DashboardController controller;

  const TokenDetailsSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF8F9FA),
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Obx(() {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Token Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 6),

              const Text(
                "Complete breakdown of all tokens",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: List.generate(controller.tokenDetails.length, (
                  index,
                ) {
                  final item = controller.tokenDetails[index];
                  final gradient = item["color"] as LinearGradient;

                  bool isLastFull = index == controller.tokenDetails.length - 1;

                  return StaggeredGridTile.fit(
                    crossAxisCellCount: isLastFull ? 2 : 1,
                    child: Container(
                      height: 140, // ✅ FIX: fixed height added
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: gradient,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            item["icon"],
                            height: 37,
                            width: 37,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            item["title"],
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            item["value"].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              Buttonfield.Mainbuttonfield(
                text: "Close",
                onPressed: () {
                  Get.back();
                },
              ),

              const SizedBox(height: 60),
            ],
          ),
        );
      }),
    );
  }
}
