import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginInputfield {
  static Widget AdminEmail({
    required TextEditingController controller,
    required String text,
    required String labeltext,
    required bool tohide,
    String? errorText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labeltext,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: tohide,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: text, // ✅ label
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelStyle: TextStyle(color: Colors.grey, fontSize: 14),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),

            prefixIcon: Padding(
              padding: const EdgeInsets.all(15),
              child: FaIcon(FontAwesomeIcons.envelope, size: 18),
            ),

            errorText: errorText,
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          ),
        ),
      ],
    );
  }

  static Widget AdminPassword({
    required TextEditingController controller,
    required String text,
    required String labeltext,
    required bool tohide,
    String? errorText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labeltext,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: tohide,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: text, // ✅ label
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelStyle: TextStyle(color: Colors.grey, fontSize: 14),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),

            prefixIcon: Padding(
              padding: const EdgeInsets.all(15),
              child: FaIcon(FontAwesomeIcons.envelope, size: 18),
            ),

            errorText: errorText,
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          ),
        ),
      ],
    );
  }
}
