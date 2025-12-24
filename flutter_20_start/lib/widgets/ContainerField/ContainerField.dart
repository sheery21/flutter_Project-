import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Containerfield {
  static Widget customContainerfield({
    required String text,
    Widget? iconWidget,
  }) {
    return Container(
      height: 50,
      width: 255,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Color(0xFFFDF4D6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (iconWidget != null) iconWidget,
          const SizedBox(width: 10),
          Container(
            width: 160,
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            
          ),
        ],
      ),
    );
  }
static Widget customCircularImagesField({
  required String imagePath,
}) {
  return Container(
    height: 50, // FIXED container
    width: 50,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
      border: Border.all(
        color: Colors.black,
        width: 2,
      ),
    ),
    child: Center(
      child: Image.asset(
        imagePath,
        width: 23,   // 👈 image chhoti
        height: 23,
        fit: BoxFit.contain,
      ),
    ),
  );
}


}
