import 'package:flutter/material.dart';

class Butttonfield {
  static CustomStartButtonField({
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 45,
      width: 249,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero, // important for gradient
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF1A5D1A),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: "Poppins",
              color: Color(0xFFF1C93B),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  static Custom_LogInSignUp_ButtonField({
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 45,
      width: 250,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero, // important for gradient
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF1A5D1A),
            borderRadius: BorderRadius.circular(40),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: "Poppins",
              color: Color(0xFFF1C93B),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
