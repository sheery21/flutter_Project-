import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_11_start/screens/login.dart';
import 'package:flutter_11_start/widgets/uihelper.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomImage(imgUrl: 'insta_icon.png'),
            SizedBox(height: 10),
            UiHelper.CustomImage(imgUrl: 'insta_Logo.png'),
          ],
        ),
      ),
    );
  }
}
