import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_12_start/screens/Login/loginPage.dart';
import 'package:flutter_12_start/screens/SignUp/signUpPage.dart';

import '../../widgets/uihelpar.dart';

class Statedloginpage extends StatefulWidget {
  const Statedloginpage({super.key});

  @override
  State<Statedloginpage> createState() => _StatedloginpageState();
}

class _StatedloginpageState extends State<Statedloginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            UiHelper.CustomImage(
              imagePath: 'Capa_1.png',
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: UiHelper.CustomImage(imagePath: 'Mask-group.png'),
            ),
            Positioned(
              top: 290,
              left: 70,
              child: UiHelper.CustomImage(
                imagePath: "Group-59.png",
                height: 240,
                width: 240,
              ),
            ),
            Positioned(
              top: 550,
              left: 130,
              child: Text(
                'Let’s get started!',
                style: UiHelper.blueTextFeildStyle(),
              ),
            ),
            Positioned(
              top: 600,
              left: 30,

              child: UiHelper.CustomButton(
                callback: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                buttonName: 'Login',
              ),
            ),
            Positioned(
              top: 680,
              left: 30,
              child: UiHelper.CustomWhiteButton(
                callback: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                buttonName: 'Create an Account',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
