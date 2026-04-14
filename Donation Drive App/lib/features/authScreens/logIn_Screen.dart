import 'package:donation_drive/widgets/InputField/logIn_InputField.dart';
import 'package:donation_drive/widgets/TextStyleField/headingField.dart';
import 'package:donation_drive/widgets/TextStyleField/textField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final TextEditingController controller = TextEditingController();

bool tohide = false;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFF8F9FA)),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/ContainerLogin.png"),
            SizedBox(height: 20),
            Text("Welcome Back", style: TextStyleField.Heading_1()),
            SizedBox(height: 8),
            Text(
              "Sign in to access your admin dashboard",
              style: ShortTextField.Heading_1(),
            ),
            SizedBox(height: 25),
            Container(
              width: 350,

              decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    LoginInputfield.AdminEmail(
                      controller: controller,
                      labeltext : "Email Address",
                      text: "admin@example.com",
                      tohide: tohide,
                    ),
                    SizedBox(height: 20,),
                    LoginInputfield.AdminPassword(
                      controller: controller,
                      labeltext : "Email Address",
                      text: "admin@example.com",
                      tohide: tohide,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
