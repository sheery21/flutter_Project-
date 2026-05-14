import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logincontroller extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isHidden = true.obs;
  final isLoading = false.obs;
  final isRemember = false.obs;

  static const String ISLOGGEDIN = "isLoggedIn";
  static const String EMAIL = "email";
  static const String PASSWORD = "password";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadSavedData();
  }

  void togglePassword() {
    isHidden.value = !isHidden.value;
  }

  void toggleRemember(bool? value) {
    isRemember.value = value ?? false;
  }

  Future<void> loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool(ISLOGGEDIN) ?? false;

    if (loggedIn) {
      Future.delayed(Duration.zero, () {
        Get.offAllNamed("/BottomNavbar");
      });
    }

    if (prefs.getString(EMAIL) != null) {
      emailController.text = prefs.getString(EMAIL)!;
      passwordController.text = prefs.getString(PASSWORD) ?? "";
      isRemember.value = true;
    }
  }

  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Email or Password cannot be empty",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      await Future.delayed(Duration(seconds: 1));
      if (email == "admin@gmail.com" && password == "admin") {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        await prefs.setBool(ISLOGGEDIN, true);
        await prefs.setString(PASSWORD, password);
        if (isRemember.value) {
          await prefs.setString(EMAIL, email);
          await prefs.setString(PASSWORD, password);
        } else {
          await prefs.remove(EMAIL);
          await prefs.remove(PASSWORD);
        }

        Get.snackbar(
          "Success",
          "Login Successful",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAllNamed("/BottomNavbar");
      } else {
        Get.snackbar(
          "Login Failed",
          "Invalid email or password",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
