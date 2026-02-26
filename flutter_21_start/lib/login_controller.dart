import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/http/stub/file_decoder_stub.dart';
import 'package:http/http.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passController = TextEditingController().obs;
  void loginApi() async {
    try {
      final response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          "email": emailController.value.text,
          "password": passController.value.text,
        },
      );

      var data = jsonDecode(response.body);

      print("data $data");
      print("response ${response.statusCode}");

      if (response.statusCode == 200) {
        Get.snackbar("Login sucessFull", data["error"]);
      } else {
        Get.snackbar("Login Failed", data["error"]);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
      // patch(e.toString());
    }
  }
}
