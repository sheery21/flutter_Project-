import 'package:donation_drive/features/Controllers/QR_Controller.dart';
import 'package:donation_drive/features/authScreens/logIn_Screen.dart';
import 'package:donation_drive/widgets/FiltersField/filterField.dart';
import 'package:donation_drive/widgets/GenerateQRHeader/generateQRHeader.dart';
import 'package:donation_drive/widgets/GenerateQRHeader/genrateTokenCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tokenspage extends StatefulWidget {
final QRController controller = Get.put(QRController());


  @override
  State<Tokenspage> createState() => _TokenspageState();
}


class _TokenspageState extends State<Tokenspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            /// HEADER
            GenerateQRHeader(
              total: 5000,
              active: 875,
              delivered: 1750,
            ),

            /// OVERLAP EFFECT (optional spacing)
            Transform.translate(
              offset: Offset(0, -20), // thoda overlap feel
              child: Column(
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
                  Filterfield()

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

IconData getStatusIcon(String status) {
  switch (status) {
    case "Active":
      return Icons.check_circle;
    case "Delivered":
      return Icons.local_shipping;
    case "Expired":
      return Icons.cancel;
    case "Unregistered":
    default:
      return Icons.radio_button_unchecked;
  }
}
