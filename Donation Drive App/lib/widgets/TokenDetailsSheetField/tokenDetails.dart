import 'package:donation_drive/features/Model/QRTokenModel.dart';
import 'package:donation_drive/widgets/ButtonsField/buttonField.dart';
import 'package:donation_drive/widgets/TextStyleField/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class TokenDetails extends StatefulWidget {
  final QrTokenmodel item;

  const TokenDetails({super.key, required this.item});

  @override
  State<TokenDetails> createState() => _TokenDetailsState();
}

class _TokenDetailsState extends State<TokenDetails> {
  final ScreenshotController screenshotController = ScreenshotController();

  Future<void> downloadQR() async {
    /// REQUEST PERMISSION
    await Permission.storage.request();
    await Permission.photos.request();

    /// CAPTURE SCREENSHOT
    final image = await screenshotController.capture(
      delay: const Duration(milliseconds: 10),
    );

    if (image == null) {
      Get.snackbar("Error", "Failed to capture QR");

      return;
    }

    /// SAVE IMAGE
    final result = await ImageGallerySaverPlus.saveImage(
      image,
      quality: 100,
      name: "QR_${DateTime.now().millisecondsSinceEpoch}",
    );

    print(result);

    if (result["isSuccess"] == true || result["filePath"] != null) {
      Get.snackbar("Success", "QR saved to gallery");
    } else {
      Get.snackbar("Error", "Failed to save QR");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,

          children: [
            /// TOP BAR
            Container(
              width: 40,
              height: 5,
              margin: const EdgeInsets.only(bottom: 10),

              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            /// HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                const Text(
                  "Token Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),

            const SizedBox(height: 10),

            /// SCREENSHOT AREA
            Screenshot(
              controller: screenshotController,

              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Column(
                  children: [
                    /// QR CARD
                    Container(
                      padding: const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),

                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 6),
                        ],
                      ),

                      child: QrImageView(data: widget.item.QR_Code, size: 120),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "QR Code: ${widget.item.serialNumber}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// SERIAL
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("Serial Number", style: ShortTextField.mainShortText_2()),

                const SizedBox(height: 4),

                Text(
                  "#${widget.item.serialNumber}",

                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Inter",
                    color: Color(0xFF101828),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// CAMPAIGN + STATUS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                /// CAMPAIGN
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text("Campaign", style: ShortTextField.mainShortText_2()),

                    const SizedBox(height: 4),

                    Text(
                      widget.item.campaign,

                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: "Inter",
                        color: Color(0xFF101828),
                      ),
                    ),
                  ],
                ),

                /// STATUS
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),

                      child: Text(
                        "Status",
                        style: ShortTextField.mainShortText_2(),
                      ),
                    ),

                    const SizedBox(height: 4),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),

                      decoration: BoxDecoration(
                        color: getStatusColor(
                          widget.item.status,
                        ).withOpacity(0.1),

                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Text(
                        widget.item.status,

                        style: const TextStyle(
                          color: Color(0xFF101828),
                          fontSize: 16,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// DATE
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text(
                  "Generated Date",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 4),

                Text(
                  DateFormat(
                    "MMM dd, yyyy HH:mm",
                  ).format(widget.item.generatedData),

                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),

            const SizedBox(height: 35),

            /// DOWNLOAD BUTTON
            Container(
              width: double.infinity,

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2563EB), Color(0xFF7C3AED)],
                ),

                borderRadius: BorderRadius.circular(12),
              ),

              child: Buttonfield.MainbuttonWithIconfield(
                text: "Download QR Code",

                onPressed: () {
                  downloadQR();
                },

                icon: SvgPicture.asset("assets/Icons/download_QR.svg"),
              ),
            ),

            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "Active":
        return const Color(0xFF22C55E);

      case "Expired":
        return const Color(0xFFEF4444);

      case "Delivered":
        return const Color(0xFF3B82F6);

      case "Unregistered":
        return const Color(0xFFF59E0B);

      default:
        return Colors.grey;
    }
  }
}
