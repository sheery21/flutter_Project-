import 'package:donation_drive/features/Model/QRTokenModel.dart';
import 'package:flutter/material.dart';

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
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 100, width: 100, color: Colors.black),

          const SizedBox(height: 8),

          Text(
            data.serialNumber,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),

          const SizedBox(height: 6),

          const Text(
            "ابتدائی شناختی کارڈ (CNIC) ضروری سافٹ لانچ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
    ;
  }
}
