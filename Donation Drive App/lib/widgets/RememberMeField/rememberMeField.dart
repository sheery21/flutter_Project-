import 'package:flutter/material.dart';

class Remembermefield {
  static Widget build({
    required bool value,
    required Function(bool?) onChanged,
  }) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChanged),
        GestureDetector(
          onTap: () {
            onChanged(!value);
          },
          child: Text(
            "Remember me",
            style: TextStyle(
              fontFamily: "Inter",
              color: Color(0xFF0A0A0A),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
