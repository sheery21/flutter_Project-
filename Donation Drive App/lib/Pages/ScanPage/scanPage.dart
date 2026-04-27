import 'package:donation_drive/features/Controllers/QR_Controller.dart';
import 'package:donation_drive/widgets/ScanToDeliverField/ScanToDeliverField.dart';
import 'package:donation_drive/widgets/TextStyleField/headingField.dart';
import 'package:donation_drive/widgets/TextStyleField/textField.dart';
import 'package:donation_drive/widgets/UserDetailsSheet/userDetailsSheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Scanpage extends StatefulWidget {
  const Scanpage({super.key});

  @override
  State<Scanpage> createState() => _ScanpageState();
}

final QRController controller = Get.put(QRController());
final _formKey = GlobalKey<FormState>();

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

            Form(
              key: _formKey,
              child: ScanToDeliverField(
                controller: serialController,
                onLookup: () {
                  if (_formKey.currentState!.validate()) {

                    final serial = serialController.text.trim();
                    final result = controller.findBySerial(serial);

                    if (result != null) {
                      Get.bottomSheet(
                        UserdetailsSheet(item: result),
                        isScrollControlled: true,
                        backgroundColor: const Color(0xFFFAFAF9),
                      );
                    } else {
                      Get.snackbar("Error", "Token not found");
                    }

                  }
                },
                onScan: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
