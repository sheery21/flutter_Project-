import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class InputFieldHelper {
  static Widget CustomTextField({
    required TextEditingController controller,
    required String text,
    required bool tohide,
    String? errorText,
    ValueChanged<String>? onChanged,
  }) {
    return Container(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller,
            obscureText: tohide,
            onChanged: onChanged,
            cursorColor: const Color(0xFF24786D),
            decoration: InputDecoration(
              labelText: text,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              labelStyle: TextStyle(
                color: errorText == null ? Color(0xFF24786D) : Colors.red,
                fontSize: 16,
                fontFamily: "poppins",
                fontWeight: FontWeight.w400,
              ),
              floatingLabelStyle: TextStyle(
                color: errorText == null ? Color(0xFF24786D) : Colors.red,
                fontSize: 14,
                fontFamily: "poppins",
                fontWeight: FontWeight.w700,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: errorText == null ? Color(0xFFCDD1D0) : Colors.red,
                  width: 1.5,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: errorText == null ? Color(0xFF24786D) : Colors.red,
                  width: 1.5,
                ),
              ),
              border: InputBorder.none,
            ),
          ),
          if (errorText != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                errorText,
                textAlign: TextAlign.right, // 👈 right-align
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  static Widget CustomNumbField({
    required TextEditingController controller,
    required String text,
    String? errorText,
    ValueChanged<String>? onChanged,
  }) {
    return Container(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller,

            
            onChanged: onChanged,
            cursorColor: const Color(0xFF24786D),
            keyboardType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              labelText: text,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              labelStyle: TextStyle(
                color: errorText == null ? Color(0xFF24786D) : Colors.red,
                fontSize: 16,
                fontFamily: "poppins",
                fontWeight: FontWeight.w400,
              ),
              floatingLabelStyle: TextStyle(
                color: errorText == null ? Color(0xFF24786D) : Colors.red,
                fontSize: 14,
                fontFamily: "poppins",
                fontWeight: FontWeight.w700,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: errorText == null ? Color(0xFFCDD1D0) : Colors.red,
                  width: 1.5,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: errorText == null ? Color(0xFF24786D) : Colors.red,
                  width: 1.5,
                ),
              ),
              border: InputBorder.none,
            ),
          ),
          if (errorText != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                errorText,
                textAlign: TextAlign.right, // 👈 right-align
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  static Widget CustomPassTextField({
    required TextEditingController controller,
    required String text,
    required bool tohide,
    String? errorText,
    TextInputType textInputType = TextInputType.text,
    ValueChanged<String>? onChanged,
    VoidCallback? onTap,
  }) {
    return Container(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller,
            obscureText: tohide,
            keyboardType: textInputType,
            onChanged: onChanged,
            cursorColor: const Color(0xFF24786D),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              labelText: text,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              labelStyle: TextStyle(
                color: errorText == null ? Color(0xFF24786D) : Colors.red,
                fontSize: 16,
                fontFamily: "poppins",
                fontWeight: FontWeight.w400,
              ),
              floatingLabelStyle: TextStyle(
                color: errorText == null ? Color(0xFF24786D) : Colors.red,
                fontSize: 14,
                fontFamily: "poppins",
                fontWeight: FontWeight.w700,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: errorText == null ? Color(0xFFCDD1D0) : Colors.red,
                  width: 1.5,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: errorText == null ? Color(0xFF24786D) : Colors.red,
                  width: 1.5,
                ),
              ),
              border: InputBorder.none,
              suffixIcon: IconButton(
                onPressed: onTap,
                icon: Icon(
                  tohide ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // 👇 Error text right side
          if (errorText != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                errorText,
                textAlign: TextAlign.right,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
