import 'package:donation_drive/features/Controllers/dashboard_controller.dart';
import 'package:donation_drive/widgets/DistributionSummaryField/DistributionSummaryCards.dart';
import 'package:donation_drive/widgets/NavbarField/navBarField.dart';
import 'package:donation_drive/widgets/TokenAnalytics/TokenAnalyticsCard.dart';
import 'package:donation_drive/widgets/TokenDetailsSheetField/tokenDetailsSheet.dart';
import 'package:donation_drive/widgets/TokenSummaryFirld/tokenSummaryCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Dashboardpage extends StatefulWidget {
  const Dashboardpage({super.key});

  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage> {
  final DashboardController controller = Get.put(
    DashboardController(),
    permanent: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbarfield.mainNavbar(
        onMenuTap: () {
          print("hello");
        },
        onBellTap: () {
          print("hello");
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Obx(
                () => TokenSummaryCard(
                  title: "Total Tokens",
                  value: controller.totalTokens.value,
                  subtitle: "Tap to view details",
                  onTap: () {
                    print(
                      "UI rebuild - TotalTokens: ${controller.totalTokens.value.toString()}",
                    );
                    Get.bottomSheet(
                      TokenDetailsSheet(controller: controller),
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "By Campaingn",
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "View All",
                        style: TextStyle(
                          color: Color(0xFFF54900),
                          fontFamily: "Outfit",
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: controller.campaigns.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 13),
                      child: DistributionSummaryCard(
                        title: item["title"],
                        subtitle: "${item["total"]} Total",
                        unregistered: item["unregistered"],
                        registered: item["registered"],
                        delivered: item["delivered"],
                      ),
                    );
                  }).toList(),
                );
              }),
              SizedBox(height: 13),
              Obx(
                () => TokenAnalyticsCard(
                  unregistered: controller.unregistered.value,
                  registered: controller.registered.value,
                  delivered: controller.delivered.value,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
