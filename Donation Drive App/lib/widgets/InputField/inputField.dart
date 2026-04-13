import 'package:flutter/material.dart';

class LoginInputfield {
  static Widget AdminEmail({
    required TextEditingController controller,
    required String text,
    required bool tohide,
    String? errorText,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
