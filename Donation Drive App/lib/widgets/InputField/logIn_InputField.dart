import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginInputfield {
  
  static Widget AdminEmail({
    required TextEditingController controller,
    required String text,
    required bool tohide,
    String? errorText,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(),
        ),
        prefixIcon: Center(
          widthFactor: 1,
            child: FaIcon(FontAwesomeIcons.envelope                                                                                                                                                                                                                                                                                                                                                                                                                                                      )),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
