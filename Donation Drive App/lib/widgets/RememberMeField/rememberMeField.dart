import 'package:flutter/material.dart';

class Remembermefield {
  static Widget build({
    required bool value,
    required Function(bool?) onChanged,
  }) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.blue,
          checkColor: Colors.white,
          side: BorderSide(color: Color(0xFFCCCCCC)),
        ),
        GestureDetector(
          onTap: () {
            onChanged(!value);
          },
          child: Text(
            "Remember me",
            style: TextStyle(
              fontFamily: "Inter",
              color: Color(0xFF717182),
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
