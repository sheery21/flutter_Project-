import 'package:flutter/material.dart';
import 'package:flutter_20_start/widgets/ButtonField/butttonField.dart';
import 'package:flutter_20_start/widgets/ColorsField/colorsField.dart';
import 'package:flutter_20_start/widgets/ContainerField/ContainerField.dart';
import 'package:flutter_20_start/widgets/InputField/inputField.dart';
import 'package:flutter_20_start/widgets/TextStyleField/TextStyleField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String emailtext = "Email";
  String passText = "Password";
  bool tohide = false;
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colorsfield.customColorField()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Login Now",
              style: Textstylefield.Custom_LogInSignUp_TextStyleField(),
            ),
            SizedBox(height: 20),
            InputFieldHelper.CustomTextField(
              controller: emailController,
              text: emailtext,
              tohide: tohide,
            ),
            SizedBox(height: 20),
            InputFieldHelper.CustomPassTextField(
              controller: passController,
              text: passText,
              tohide: hidePassword,
              onTap: () {
                hidePassword = !hidePassword;
                setState(() {});
              },
            ),
            SizedBox(height: 50),
            Butttonfield.Custom_LogInSignUp_ButtonField(
              text: "Login",
              onPressed: () {
                print("Login Button Pressed");
              },
            ),
            SizedBox(height: 20),
            Text(
              "Or Login with",
              style: Textstylefield.Custom_Or_LogIn_Text_TextStyleField(),
            ),
            SizedBox(height: 20),
            Containerfield.customContainerfield(text: "Login with Facebook", icon: FontAwesomeIcons.facebookF ),
          ],
        ),
      ),
    );
  }
}
