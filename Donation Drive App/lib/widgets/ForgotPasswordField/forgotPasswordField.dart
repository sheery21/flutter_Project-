import 'package:donation_drive/widgets/ColorsField/ColorField.dart';
import 'package:flutter/cupertino.dart';

class Forgotpasswordfield {
  static Widget build({required VoidCallback onTap}) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          "Forgot Password?",
          style: TextStyle(
            fontFamily: "Inter",
            color: ColorsField.MainColorField(),
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
