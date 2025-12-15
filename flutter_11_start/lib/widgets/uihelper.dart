import 'package:flutter/material.dart';

class UiHelper {
  static CustomTextField({
    required TextEditingController controller,
    required String text,
    required bool tohide,
    TextInputType textInputType = TextInputType.text,
  }) {
    return Container(
      height: 50,
      width: 343,
      decoration: BoxDecoration(
        // color: Color(0xFF121212),
        border: Border.all(color: Colors.grey.shade700),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: TextField(
          controller: controller,
          obscureText: tohide,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
          keyboardType: textInputType,
          decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  static Widget CustomImage({required String imgUrl}) {
    return Image.asset('assests/images/${imgUrl}');
  }

  static Widget customImage({
    required String imgUrl,
    double? height,
    double? width,
  }) {
    return Image.asset(
      'assests/images/${imgUrl}',
      height: height,
      width: width,
      fit: BoxFit.cover, // image stretch na ho, proportion maintain kare
    );
  }

  static CustomButton({
    required VoidCallback callback,
    required String buttonName,
  }) {
    return SizedBox(
      height: 44,
      width: 343,
      child: ElevatedButton(
        onPressed: () {
          callback();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF3797EF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 16, color: Colors.white),
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
        style: TextStyle(color: Color(0xFF3797EF), fontSize: 16),
      ),
    );
  }
}
