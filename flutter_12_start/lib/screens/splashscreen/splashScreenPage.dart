import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_12_start/screens/statedLogin/statedLoginPage.dart';
import 'package:flutter_12_start/widgets/uihelpar.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({super.key});

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {


  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              Statedloginpage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Fade effect
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 800), // speed control
        ),
      );
    });


    return Scaffold(
      body: Container(child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: UiHelper.CustomImage(imagePath: 'boarbwalk-background.jpg' ),
        )
      ],
      ),
      ),
    );
  }
}
