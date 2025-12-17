import 'package:flutter/material.dart';
import 'package:flutter_20_start/features/auth/screens/login_screens.dart';
import 'package:flutter_20_start/widgets/ButtonField/butttonField.dart';
import 'package:flutter_20_start/widgets/ColorsField/colorsField.dart';
import 'package:flutter_20_start/widgets/TextStyleField/TextStyleField.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
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
            Text(
              "TalkDM",
              style: Textstylefield.Custom_WelcomeBack_TextStyleField(),
            ),
            SizedBox(height: 30),
            Image.asset("assets/images/Group1.png"),
            SizedBox(height: 80),
            Text(
              "Let’s talk with new friends",
              style: Textstylefield.Custom_WelcomeBack_2_TextStyleField(),
            ),
            SizedBox(height: 20),
            Butttonfield.CustomStartButtonField(
              text: "Get Start",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreens()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
