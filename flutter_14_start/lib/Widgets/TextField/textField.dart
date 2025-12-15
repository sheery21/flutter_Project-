import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class textField{
  static CustomTextField({
    required TextEditingController controller,
    required String text,
    required bool tohide,
    TextInputType textInputType = TextInputType.name,
  }) {
    return Container(
      height: 48,
      width: 335,
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFF333333)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: TextField(
          controller: controller,
          obscureText: tohide,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
            hintStyle: TextStyle(
              color: Color(0xFFAFAFAF),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
  static CustomWhiteTextField({
    required TextEditingController controller,
    required String text,
    TextInputType textInputType = TextInputType.name,
  }) {
    return Container(
      height: 44,
      width:  345,
      decoration: BoxDecoration(
        color: Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFFE5E7EB)),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 10,
            ),
            child: Icon(
              Icons.search,
              color: Color(0XFF8E8E93),
              size: 20,
            ),
          ),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          border: InputBorder.none,
        ),
      ),
    );
  }



}