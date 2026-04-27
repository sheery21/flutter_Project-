import 'package:flutter/material.dart';

class TextStyleField {
  static TextStyle Heading_1() {
    return const TextStyle(
      fontFamily: "Inter",
      color: Color(0xFF0A0A0A),
      fontSize: 28,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle Heading_2() {
    return const TextStyle(
      fontFamily: "Inter",
      color: Color(0xFF030213),
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
  }
}
