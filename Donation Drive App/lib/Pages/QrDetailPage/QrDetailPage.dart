import 'dart:io';

import 'package:donation_drive/features/Model/QRTokenModel.dart';
import 'package:donation_drive/widgets/ButtonsField/buttonField.dart';
import 'package:donation_drive/widgets/ButtonsField/loginButtonField.dart';
import 'package:donation_drive/widgets/ColorsField/ColorField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class QrDetailPage extends StatefulWidget {
  final QrTokenmodel data;
  final String campaign;

  const QrDetailPage({super.key, required this.data, required this.campaign});

  @override
  State<QrDetailPage> createState() => _QrDetailPageState();
}

class _QrDetailPageState extends State<QrDetailPage> {
  final ScreenshotController screenshotController = ScreenshotController();

  // Future<void> downloadQR() async {
  //   final image = await screenshotController.capture();
  //   if (image == null) return;
  //
  //   final dir = await getTemporaryDirectory();
  //   final filePath =
  //       '${dir.path}/QR_${DateTime.now().millisecondsSinceEpoch}.png';
  //
  //   final file = File(filePath);
  //   await file.writeAsBytes(image);
  //
  //   await GallerySaver.saveImage(file.path);
  //
  //   ScaffoldMessenger.of(
  //     context,
  //   ).showSnackBar(SnackBar(content: Text("Saved to Gallery")));
  //
  //   // final dir = await getApplicationDocumentsDirectory();
  //   // final file = File(
  //   //   '${dir.path}/QR_${DateTime.now().millisecondsSinceEpoch}.png',
  //   // );
  //   //
  //   // await file.writeAsBytes(image);
  //   //
  //   // ScaffoldMessenger.of(
  //   //   context,
  //   // ).showSnackBar(SnackBar(content: Text("QR Downloaded")));
  // }

  Future<void> shareQR() async {
    final image = await screenshotController.capture();
    if (image == null) return;

    final dir = await getTemporaryDirectory();
    final file = File(
      '${dir.path}/QR_${DateTime.now().millisecondsSinceEpoch}.png',
    );

    await file.writeAsBytes(image);

    await Share.shareXFiles([XFile(file.path)], text: "Scan this QR");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Back",
          style: TextStyle(color: ColorsField.MainColorField()),
        ),
        leading: BackButton(color: ColorsField.MainColorField()),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // TAG
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: getCampaignColor(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.data.campaign,
                  style: TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(height: 16),

              // QR
              Screenshot(
                controller: screenshotController,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 6),
                    ],
                  ),
                  child: QrImageView(data: widget.data.QR_Code, size: 200),
                ),
              ),

              const SizedBox(height: 16),

              // SERIAL
              Text(
                widget.data.serialNumber,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              Text("Company: ${widget.data.campaign}"),

              const Divider(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("ضروری ساتھ لائیں"),
                  SizedBox(width: 6),
                  const Text("(CNIC)"),
                  SizedBox(width: 6),
                  const Text("ابتدائی شناختی کارڈ"),
                ],
              ),

              const SizedBox(height: 20),

              // DOWNLOAD BUTTON
              Buttonfield.MainbuttonWithIconfield(
                text: "Download QR",
                onPressed: () {
                  // downloadQR();
                },
                icon: SvgPicture.asset("assets/Icons/download_QR.svg"),
              ),

              const SizedBox(height: 10),

              // SHARE BUTTON
              Buttonfield.MainbuttonWithIconfield(
                text: "Share QR",
                onPressed: () {
                  shareQR();
                },
                icon: SvgPicture.asset("assets/Icons/share_Icon.svg"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getCampaignColor() {
    switch (widget.campaign) {
      case "Awam x Tuba Foundation":
        return Colors.blue;
      case "Awan x FGRF":
        return Colors.green;
      default:
        return Colors.orange;
    }
  }
}
