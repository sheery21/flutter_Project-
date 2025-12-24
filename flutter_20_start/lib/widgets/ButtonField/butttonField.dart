import 'package:flutter/material.dart';

class Butttonfield {
  static CustomStartButtonField({
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 45,
      width: 230,
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
      bool isEnabled = true,
  }) {
    return SizedBox(
      height: 50,
      width: 300,
      child: ElevatedButton(
         onPressed: isEnabled ? onPressed : null, //
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero, // important for gradient
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: isEnabled ? Color(0xFF24786D) : Color(0xFFB0B3B2),
            borderRadius: BorderRadius.circular(40),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: "Poppins",
              color: Color(0xFFFFFFFF),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  static Widget Custom_Forgot_TextButtonField({
    required String text,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Color(0xFF797C7B),
        textStyle: TextStyle(
          fontFamily: "Poppins",
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: Text(text),
    );
  }
}
