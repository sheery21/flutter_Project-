import 'package:flutter/material.dart';

class DividerField {

  static Widget orDivider({
    String text = "OR",
    Color color = Colors.grey,
  }) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: color,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: color,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
