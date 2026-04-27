import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inputfield {

  static Widget InputField ({
    required TextEditingController controller,
    required String hintText,

    String? errorText,
}) {
    return TextField(
      controller: controller,
      decoration:  InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),

    );
  }
}