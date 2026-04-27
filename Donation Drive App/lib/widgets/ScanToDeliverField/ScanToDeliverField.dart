import 'package:donation_drive/widgets/ButtonsField/buttonField.dart';
import 'package:donation_drive/widgets/ButtonsField/loginButtonField.dart';
import 'package:donation_drive/widgets/InputField/inputField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScanToDeliverField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onLookup;
  final VoidCallback onScan;

  const ScanToDeliverField({
    super.key,
    required this.controller,
    required this.onLookup,
    required this.onScan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          /// ICON + TITLE
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Color(0xFFEAF1FF),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.camera_alt_outlined,
              size: 40,
              color: Color(0xFF1E5EFF),
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "Scan to Deliver",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 4),

          const Text(
            "Use camera or enter manually",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),

          const SizedBox(height: 20),

          /// SERIAL FIELD
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Serial Number",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),

          const SizedBox(height: 8),

          Inputfield.InputField(controller: controller, hintText: "0001"),

          const SizedBox(height: 14),

          /// LOOKUP BUTTON
          Buttonfield.Writebuttonfield(text: "Look up", onPressed: onLookup),

          const SizedBox(height: 12),

          /// SCAN BUTTON
          Buttonfield.MainbuttonWithIconfield(
            text: "Scan QR using camera",
            onPressed: onScan,
            icon: SvgPicture.asset("assets/Icons/Camera_Icon.svg"),
          ),
        ],
      ),
    );
  }
}
