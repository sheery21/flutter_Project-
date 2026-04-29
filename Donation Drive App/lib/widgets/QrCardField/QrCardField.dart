import 'package:donation_drive/features/Model/QRTokenModel.dart';
import 'package:donation_drive/widgets/TextStyleField/textField.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCardField extends StatelessWidget {
  final QrTokenmodel data;

  const QrCardField({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Color(0xFFE5E7EB), blurRadius: 1, spreadRadius: 2),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            child: QrImageView(data: data.QR_Code),
          ),

          const SizedBox(height: 12),

          Text(
            data.serialNumber,
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
          ),

          Text(
            "ابتدائی شناختی کارڈ",
            textAlign: TextAlign.center,
            style: ShortTextField.UrduText(),
          ),

          Text(
            "ضروری ساتھ (CNIC)",
            textAlign: TextAlign.center,
            style: ShortTextField.UrduText(),
          ),

          Text(
            "لائیں",
            textAlign: TextAlign.center,
            style: ShortTextField.UrduText(),
          ),
        ],
      ),
    );
  }
}
