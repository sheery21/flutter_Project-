import 'package:flutter/material.dart';
import 'package:flutter_11_start/screens/login.dart';
import 'package:flutter_11_start/widgets/uihelper.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();


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
        UiHelper.CustomImage(imgUrl: 'insta_Logo.png'),
            SizedBox(height: 20),
            UiHelper.CustomTextField(controller: nameController, text: 'Enter your name', tohide: false),
            SizedBox(height: 10),
            UiHelper.CustomTextField(controller: emailController, text: 'Enter your email', tohide: false),
            SizedBox(height: 10),
            UiHelper.CustomTextField(controller: passwordController, text: 'Enter your password', tohide: true),
            SizedBox(height: 10),
            UiHelper.CustomButton(callback: () {}, buttonName: 'Sign up'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.CustomImage(imgUrl: 'Shape.png'),
                UiHelper.CustomTextButton(text: 'Sign up with Facebook', callback: () {}),
              ],
            ),
            SizedBox(height: 18),
            Text('OR', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey.shade100),),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey.shade100),),
                UiHelper.CustomTextButton(text: 'Log in', callback: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                }),
              ],
            ),
      ],),),
    );
  }
}
