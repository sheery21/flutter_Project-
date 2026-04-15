import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Buttonsfield {
  static Loginbuttonfield({
    required String text,
    required VoidCallback onPressed
}){
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0A0A0A),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(onPressed: onPressed, child: Text(
        text,
        style: TextStyle(
          fontFamily: "Inter",
          color: Color(0xFFFFFFFF),
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),),
    );
  }
}