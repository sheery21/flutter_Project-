import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_20_start/services/auth_service.dart';
import 'package:flutter_20_start/services/firestore_service.dart';
import 'package:flutter_20_start/services/local_storage_service.dart';
import 'package:flutter_20_start/widgets/ButtonField/butttonField.dart';
import 'package:flutter_20_start/widgets/ColorsField/colorsField.dart';
import 'package:flutter_20_start/widgets/ContainerField/ContainerField.dart';
import 'package:flutter_20_start/widgets/DividerField/dividerField.dart';
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
  String emailtext = "Yoru email";
  String passText = "Password";
  bool tohide = false;
  bool hidePassword = true;
  bool isFormFilled = false;
  String? emailError;
  String? passError;
  @override
  Widget build(BuildContext context) {
    void checkForm() {
      setState(() {
        if (emailController.text.isEmpty ||
            !emailController.text.contains("@")) {
          emailError = "Enter a valid email";
        } else {
          emailError = null;
        }

        if (passController.text.isEmpty || passController.text.length < 6) {
          passError = "Password must be at least 6 characters";
        } else {
          passError = null;
        }

        isFormFilled = emailError == null && passError == null;
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colorsfield.customColorField()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Log in to Chatbox",
                style: Textstylefield.Custom_an_H3_TextStyleField(),
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  Text(
                    "Welcome back! Sign in using your social",
                    style: Textstylefield.Custom_an_P3_TextStyleField(),
                  ),
                  Text(
                    "account or email to continue us",
                    style: Textstylefield.Custom_an_P3_TextStyleField(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await AuthService().signInWithFacebook();
                      Navigator.pushReplacementNamed(context, "/bottomNav");
                    },
                    child: Containerfield.customCircularImagesField(
                      imagePath: "assets/images/facebook_icon.png",
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () async {
                      await AuthService().signInWithGoogle();
                      Navigator.pushReplacementNamed(context, "/bottomNav");
                    },
                    child: Containerfield.customCircularImagesField(
                      imagePath: "assets/images/google.png",
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () async {
                      await AuthService().signInWithApple();
                    },
                    child: Containerfield.customCircularImagesField(
                      imagePath: "assets/images/apple_icon.png",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Container(
                width: 300,
                child: DividerField.orDivider(
                  text: "OR",
                  color: Color(0xFF797C7B),
                ),
              ),
              SizedBox(height: 20),
              InputFieldHelper.CustomTextField(
                controller: emailController,
                text: emailtext,
                tohide: tohide,
                errorText: emailError,
                onChanged: (_) => checkForm(),
              ),
              SizedBox(height: 20),
              InputFieldHelper.CustomPassTextField(
                controller: passController,
                text: passText,
                tohide: hidePassword,
                onChanged: (_) => checkForm(),
                onTap: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              ),

              SizedBox(height: 180),
              Butttonfield.Custom_LogInSignUp_ButtonField(
                text: "Login",
                isEnabled: isFormFilled,
                onPressed: () async {
                  checkForm();
                  if (!isFormFilled) return;

                  try {
                    final auth = AuthService();
                    User? user = await auth.login(
                      emailController.text.trim(),
                      passController.text.trim(),
                      context,
                    );

                    if (user != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Login Successful!")),
                      );
                      Navigator.pushReplacementNamed(context, "/bottomNav");
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
              ),

              SizedBox(height: 20),
              Butttonfield.Custom_Forgot_TextButtonField(
                text: "Forgot password?",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
