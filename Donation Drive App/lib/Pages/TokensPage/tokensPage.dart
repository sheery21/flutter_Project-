import 'package:donation_drive/features/Controllers/QR_Controller.dart';
import 'package:donation_drive/features/authScreens/logIn_Screen.dart';
import 'package:donation_drive/widgets/FiltersField/filterField.dart';
import 'package:donation_drive/widgets/GenerateQRHeader/generateQRHeader.dart';
import 'package:donation_drive/widgets/GenerateQRHeader/genrateTokenCard.dart';
import 'package:donation_drive/widgets/TextStyleField/textField.dart';
import 'package:donation_drive/widgets/TokenCard/tokenCard.dart';
import 'package:donation_drive/widgets/TokenDetailsSheetField/tokenDetails.dart';
import 'package:donation_drive/widgets/TokenDetailsSheetField/tokenDetailsSheet.dart';
import 'package:donation_drive/widgets/TokenSummaryFirld/tokenSummaryCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tokenspage extends StatefulWidget {
  const Tokenspage({super.key});
  @override
  State<Tokenspage> createState() => _TokenspageState();
}

class _TokenspageState extends State<Tokenspage> {
  final QRController controller = Get.put(QRController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: const Color(0xFFFAFAF9),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            GenerateQRHeader(total: 5000, active: 875, delivered: 1750),

            /// OVERLAP EFFECT (optional spacing)
            Transform.translate(
              offset: Offset(0, -20), // thoda overlap feel
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GenerateTokenCard(
                      title: "Awan Distribution x Tuba Foundation",
                      subtitle: "Tokens TD-0001 to TD-0500",
                      onTap: () {},
                    ),

                    GenerateTokenCard(
                      title: "City Relief Campaign",
                      subtitle: "Tokens TD-0501 to TD-1000",
                      onTap: () {},
                    ),
                    Filterfield(),

                    SizedBox(
                      child: Text(
                        "Showing 10 of 3,500 tokens",
                        style: ShortTextField.mainShortText_3(),
                      ),
                    ),
                    Obx(() {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.filteredList.length,
                        itemBuilder: (context, index) {
                          final item = controller.filteredList[index];
                          return TokenCard(
                            campaign: item.campaign,
                            status: item.status,
                            serial: item.serialNumber,
                            date: item.generatedData,
                            onView: () {
                              Get.bottomSheet(
                                TokenDetails(item: item),
                                isScrollControlled: true,
                                backgroundColor: const Color(0xFFFAFAF9),
                              );
                            },
                          );
                        },
                      );
                    }),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.loadNext();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white70,
                        ),
                        child: Obx(
                          () => Text(
                            controller.filteredList.length >=
                                    controller.qrList.length
                                ? "Show Less"
                                : "Load More",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
