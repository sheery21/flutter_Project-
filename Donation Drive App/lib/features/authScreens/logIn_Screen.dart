import 'package:donation_drive/widgets/InputField/logIn_InputField.dart';
import 'package:donation_drive/widgets/TextStyleField/headingField.dart';
import 'package:donation_drive/widgets/TextStyleField/textField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController controller = TextEditingController();
String text = "Email";
bool tohide = true;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF8F9FA)
        ),
        width: MediaQuery.of(context).size.width,
        child:
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/ContainerLogin.png"),
            SizedBox(height: 20,),
            Text("Welcome Back", style: TextStyleField.Heading_1()),
            SizedBox(height: 8,),
            Text("Sign in to access your admin dashboard", style: ShortTextField.Heading_1()),
            SizedBox(height: 25,),
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
              child:Column(children: [
                 LoginInputfield.AdminEmail(
                controller: controller,
                text: text,
                tohide: tohide,
              ),
              ],)
            ),
          ],
        ),
      ),
    );
  }
}
