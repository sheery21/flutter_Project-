import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiHelper {
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
      width: 345,
      decoration: BoxDecoration(
        color: Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFFE5E7EB)),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Icon(Icons.search, color: Color(0XFF8E8E93), size: 20),
          ),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          border: InputBorder.none,
        ),
      ),
    );
  }

  static CustomShortTextField({
    required TextEditingController controller,
    required String text,
    required bool tohide,
    TextInputType textInputType = TextInputType.text,
  }) {
    return Container(
      height: 48,
      width: 150,
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

  static Widget CustomImage({
    required String imagePath,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
  }) {
    return Image.asset(
      'assets/images/${imagePath}',
      height: height,
      width: width,
      fit: fit,
    );
  }

  static Widget CustomRadiusImage({
    required String imagePath,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
      child: Image.asset(
        'assets/images/${imagePath}',
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }

  static CustomButton({
    required VoidCallback callback,
    required String buttonName,
  }) {
    return SizedBox(
      height: 48,
      width: 335,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero, // important for gradient
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF366190), Color(0xFF2D7ED7)], // do shade
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              buttonName,
              style: TextStyle(fontSize: 16, color: Color(0xFFFEFEFE)),
            ),
          ),
        ),
      ),
    );
  }

  static CustomWhiteButton({
    required VoidCallback callback,
    required String buttonName,
  }) {
    return SizedBox(
      height: 48,
      width: 335,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero, // important for gradient
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFF333333)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              buttonName,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF366190),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static CustomTextButton({
    required String text,
    required VoidCallback callback,
  }) {
    return TextButton(
      onPressed: () {
        callback();
      },
      child: Text(
        text,
        style: TextStyle(color: Color(0xFF3078BE), fontSize: 12),
      ),
    );
  }

  static TextStyle blueTextFeildStyle() {
    return TextStyle(
      color: Color(0xFF366190),
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle blueLinkTextFeildStyle() {
    return TextStyle(
      color: Color(0xFF3078BE),
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle blackTextFeildStyle() {
    return TextStyle(
      color: Color(0xFF181C2E),
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle LabelTextFeildStyle() {
    return TextStyle(
      color: Color(0xFF3F4652),
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle boldBlueTextFeildStyle() {
    return TextStyle(
      color: Color(0xFF366190),
      fontSize: 24.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle boldBlackTextFeildStyle() {
    return TextStyle(
      color: Color(0xFF32343E),
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle witeTextFeildStyle() {
    return TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle boldWiteTextFeildStyle() {
    return TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 22.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle boldDailyDealsTextFeildStyle() {
    return TextStyle(
      color: Color(0xFF212121),
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle ShortTextFeildStyle() {
    return TextStyle(
      color: Color(0xFF6B7280),
      fontSize: 12.0,
      fontFamily: 'Poppins',
    );
  }

  static CustomCalenderTextField({
    required TextEditingController controller,
    required String text,
    required bool tohide,
    TextInputType textInputType = TextInputType.number,
    int maxLength = 2,
  }) {
    return Container(
      height: 48,
      width: 150,
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFF333333)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: tohide,
                keyboardType: textInputType,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(maxLength),
                  FilteringTextInputFormatter.digitsOnly,
                ],
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
            Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Color(0xFFAFAFAF),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  static CustomNumberField({
    required TextEditingController controller,
    required String text,
    required bool tohide,
    TextInputType textInputType = TextInputType.number,
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
          keyboardType: textInputType,

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

  static CustomBoxField({
    required TextEditingController controller,
    required bool tohide,
    TextInputType textInputType = TextInputType.number,
  }) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFF333333)),
      ),
      child: TextField(
        controller: controller,
        obscureText: tohide,
        keyboardType: textInputType,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(border: InputBorder.none, counterText: ''),
      ),
    );
  }
}
