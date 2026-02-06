import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_20_start/features/auth/screens/login_screens.dart';
import 'package:flutter_20_start/features/auth/screens/signup_screens.dart';
import 'package:flutter_20_start/features/bottomNavbar/bottomNavbar_screen.dart';
import 'package:flutter_20_start/onboarding/Onboarding_page.dart';
import 'package:flutter_20_start/providers/user_Provider.dart';
import 'package:flutter_20_start/services/local_storage_service.dart';
import 'package:flutter_20_start/widgets/ButtonField/butttonField.dart';
import 'package:flutter_20_start/widgets/ColorsField/colorsField.dart';
import 'package:flutter_20_start/widgets/TextStyleField/TextStyleField.dart';
import 'package:flutter_20_start/widgets/chatHeaderField/chatHeaderField.dart';
import 'package:provider/provider.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Future<void> _checkLogin() async {
    await Future.delayed(const Duration(seconds: 2));

    final data = await LocalStorageService.getUser();

    if (data["uid"] != null) {
      context.read<UserProvider>().setUserFromLocal(
        uid: data["uid"] ?? "",
        name: data["name"] ?? "",
        email: data["email"] ?? "",
        phoneNumber: data["phoneNumber"] ?? "",
        imageUrl: data["imageUrl"] ?? "",
      );
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ChatHeader(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Fade effect
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: Duration(milliseconds: 800), // speed control
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SignupScreens()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colorsfield.customColorField()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Subtract.png"),
            SizedBox(height: 15),
            Text(
              "Chatbox",
              style: Textstylefield.Custom_WelcomeBack_TextStyleField(),
            ),
          ],
        ),
      ),
    );
  }
}
