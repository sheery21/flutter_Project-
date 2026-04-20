import 'package:donation_drive/widgets/ButtonsField/loginButtonField.dart';
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
bool isHidden = true;

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
              width: MediaQuery.of(context).size.width * 0.9,

              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    LoginInputfield.AdminEmail(
                      controller: controller,
                      labeltext: "Email Address",
                      text: "admin@example.com",
                      tohide: tohide,
                    ),
                    SizedBox(height: 20),
                    LoginInputfield.AdminPassword(
                      controller: controller,
                      labeltext: "Password",
                      text: "Enter your password",
                      tohide: isHidden,
                      onToggle: () => setState(() {
                        isHidden = !isHidden;
                      }),
                    ),
                    SizedBox(height: 10),
                    Row(children: []),
                    SizedBox(height: 20),
                    Buttonsfield.Loginbuttonfield(
                      text: "Sign In",
                      onPressed: () {},
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
