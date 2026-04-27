import 'package:donation_drive/features/Controllers/QR_Controller.dart';
import 'package:donation_drive/widgets/ScanToDeliverField/ScanToDeliverField.dart';
import 'package:donation_drive/widgets/TextStyleField/headingField.dart';
import 'package:donation_drive/widgets/TextStyleField/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Scanpage extends StatefulWidget {
  const Scanpage({super.key});

  @override
  State<Scanpage> createState() => _ScanpageState();
}

final QRController controller = Get.put(QRController());

final TextEditingController serialController = TextEditingController();

class _ScanpageState extends State<Scanpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: const Color(0xFFFAFAF9),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFFF3F4F6),
        child: Column(
          children: [
            Text("Scan Token", style: TextStyleField.Heading_2()),
            const SizedBox(height: 10),
            Text(
              "Scan or enter serial number",
              style: ShortTextField.mainShortText_3(),
            ),

            const SizedBox(height: 10),

            ScanToDeliverField(
              controller: serialController,
              onLookup: () {
                print("Lookup: ${serialController.text}");
              },
              onScan: () {
                print("Lookup: ${serialController.text}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
