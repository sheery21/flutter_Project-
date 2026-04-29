import 'package:donation_drive/features/Model/QRTokenModel.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrDetailPage  extends StatelessWidget {
  final QrTokenmodel data;
  final String campaign;

  const QrDetailPage ({super.key , required this.data , required this.campaign});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back"),
        leading: BackButton(),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body:Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 6),
            ],
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
                  data.campaign,
                  style: TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(height: 16),

              // QR
              QrImageView(
                data: data.QR_Code,
                size: 200,
              ),

              const SizedBox(height: 16),

              // SERIAL
              Text(
                data.serialNumber,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text("Company: ${data.campaign}"),

              const Divider(height: 30),

              const Text("ابتدائی شناختی کارڈ (CNIC) ضروری ساتھ لائیں"),

              const SizedBox(height: 20),

              // DOWNLOAD BUTTON
              ElevatedButton(
                onPressed: () {
                  // TODO: Download logic
                },
                child: Text("Download QR"),
              ),

              const SizedBox(height: 10),

              // SHARE BUTTON
              ElevatedButton(
                onPressed: () {
                  // TODO: Share logic
                },
                child: Text("Share QR"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Color getCampaignColor() {
    switch (campaign) {
      case "Awam x Tuba Foundation":
        return Colors.blue;
      case "Awan x FGRF":
        return Colors.green;
      default:
        return Colors.orange;
    }
  }
}
