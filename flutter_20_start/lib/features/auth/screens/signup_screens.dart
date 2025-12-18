import 'package:flutter/material.dart';
import 'package:flutter_20_start/services/auth_service.dart';
import 'package:flutter_20_start/widgets/ButtonField/butttonField.dart';
import 'package:flutter_20_start/widgets/ColorsField/colorsField.dart';
import 'package:flutter_20_start/widgets/ContainerField/ContainerField.dart';
import 'package:flutter_20_start/widgets/InputField/inputField.dart';
import 'package:flutter_20_start/widgets/TextStyleField/TextStyleField.dart';

class SignupScreens extends StatefulWidget {
  const SignupScreens({super.key});

  @override
  State<SignupScreens> createState() => _SignupScreensState();
}

class _SignupScreensState extends State<SignupScreens> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
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
              "Sig'nUp Now",
              style: Textstylefield.Custom_LogInSignUp_TextStyleField(),
            ),
            SizedBox(height: 100),
            InputFieldHelper.CustomTextField(
              controller: nameController,
              text: "Username",
              tohide: tohide,
            ),
            SizedBox(height: 20),
            InputFieldHelper.CustomTextField(
              controller: emailController,
              text: "Emaill",
              tohide: tohide,
            ),
            SizedBox(height: 20),
            InputFieldHelper.CustomPassTextField(
              controller: passController,
              tohide: hidePassword,
              text: "Password",
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
              text: "Sigu Up",
              onPressed: () async {
                try {
                  final auth = AuthService();
                  await auth.signup(
                    emailController.text.trim(),
                    passController.text.trim(),
                  );
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Signup Successful")));
                  Navigator.pushReplacementNamed(context, '/login');
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
