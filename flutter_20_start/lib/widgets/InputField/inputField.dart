import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputFieldHelper {
  static CustomTextField({
    required TextEditingController controller,
    required String text,
    required bool tohide,
    TextInputType textInputType = TextInputType.text,
  }) {
    return Container(
      height: 48,
      width: 255,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black, width: 1.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: TextField(
          controller: controller,
          obscureText: tohide,
          keyboardType: textInputType,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  static CustomPassTextField({
    required TextEditingController controller,
    required String text,
    required bool tohide,
    TextInputType textInputType = TextInputType.text,
    VoidCallback? onTap,
  }) {
    return Container(
      height: 48,
      width: 255,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black, width: 1.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: TextField(
          controller: controller,
          obscureText: tohide,
          keyboardType: textInputType,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
            suffixIcon: IconButton(
              onPressed: onTap,
              icon: Icon(
                tohide ? Icons.visibility_off : Icons.visibility,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
