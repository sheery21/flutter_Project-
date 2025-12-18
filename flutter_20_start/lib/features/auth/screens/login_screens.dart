import 'package:flutter/material.dart';
import 'package:flutter_20_start/services/auth_service.dart';
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
            SizedBox(height: 130),
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
            Text(
              "Or Login with",
              style: Textstylefield.Custom_Or_LogIn_Text_TextStyleField(),
            ),
            SizedBox(height: 20),
            Containerfield.customContainerfield(
              text: "Login with Facebook",
              iconWidget: Image.asset("assets/images/facebook_icon.png"),
            ),
            SizedBox(height: 20),
            Containerfield.customContainerfield(
              text: "Login with Google",
              iconWidget: Image.asset("assets/images/google.png"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontFamily: "poppins",
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                      fontFamily: "poppins",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Butttonfield.Custom_LogInSignUp_ButtonField(
              text: "Login",
              onPressed: () async {
                if (emailController.text.isEmpty ||
                    passController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill in all fields")),
                  );
                  return;
                }
                try {
                  final auth = AuthService();
                  await auth.login(
                    emailController.text.trim(),
                    passController.text.trim(),
                  );
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Login Successful')));
                  Navigator.pushReplacementNamed(context, "/bottomNav");
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
