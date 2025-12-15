import 'package:flutter/material.dart';
import 'package:flutter_11_start/screens/bottomnav.dart';
import 'package:flutter_11_start/screens/signup.dart';
import 'package:flutter_11_start/widgets/uihelper.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              child: Column(
                children: [
                  UiHelper.CustomTextField(
                    controller: emailController,
                    text: 'Email',
                    tohide: false,
                  ),
                  SizedBox(height: 10),
                  UiHelper.CustomTextField(
                    controller: passwordController,
                    text: 'password',
                    tohide: true,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      UiHelper.CustomTextButton(
                        callback: () {},
                        text: 'Forgot password?',
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  UiHelper.CustomButton(callback: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Bottomnav()));
                  }, buttonName: 'Log in'),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // UiHelper.CustomImage(imgUrl: 'Shape.png'),
                      UiHelper.CustomTextButton(
                        text: 'Log in with Facebook',
                        callback: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade100,
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade100,
                        ),
                      ),
                      UiHelper.CustomTextButton(
                        text: 'Sign up',
                        callback: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Signup()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
