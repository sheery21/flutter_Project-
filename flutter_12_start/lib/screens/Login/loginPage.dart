import 'package:flutter/material.dart';
import 'package:flutter_12_start/screens/BottomNav/bottomNav.dart';
import 'package:flutter_12_start/screens/Home/homePage.dart';
import 'package:flutter_12_start/screens/ResetPassword/resetPassword.dart';
import 'package:flutter_12_start/screens/SignUp/signUpPage.dart';
import '../../widgets/uihelpar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            UiHelper.CustomImage(
              imagePath: 'Capa_1.png',
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              top: 51,
              left: 110,
              child: UiHelper.CustomImage(
                imagePath: "Group-59.png",
                height: 167,
                width: 167,
              ),
            ),
            Positioned(
              top: 228,
              left: 100,
              child: Text(
                'Welcome Back!',
                style: UiHelper.boldBlueTextFeildStyle(),
              ),
            ),
            Positioned(
              top: 260,
              left: 72,
              child: Text(
                'Login to your existing account.',
                style: UiHelper.blackTextFeildStyle(),
              ),
            ),
            Positioned(
              top: 310,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email address', style: UiHelper.LabelTextFeildStyle()),
                  UiHelper.CustomTextField(
                    controller: emailController,
                    text: 'xyz@email.com',
                    tohide: false,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 410,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Password', style: UiHelper.LabelTextFeildStyle()),
                  UiHelper.CustomTextField(
                    controller: passwordController,
                    text: '*********',
                    tohide: true,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 490,
              left: 220,
              child: Row(
                children: [
                  UiHelper.CustomTextButton(text: 'Forgot your password?', callback: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Resetpassword()));
                  })
                ],
              ),
            ),
            Positioned(
              top: 540,
              left: 30,
              child: UiHelper.CustomButton(
                callback: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Bottomnav(startIndex: 0,)));
                },
                buttonName: 'Login',
              ),
            ),
            Positioned(
              top: 650,
              left: 0,
              right: 0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Color(0xFF32343E),
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    'or Login with',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Color(0xFF32343E),
                      indent: 10,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 700,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiHelper.CustomImage(imagePath: 'Google.png'),
                  SizedBox(width: 20),
                  UiHelper.CustomImage(imagePath: 'facebook.png'),
                  SizedBox(width: 20),
                  UiHelper.CustomImage(imagePath: 'Apple.png'),
                ],
              ),
            ),
            Positioned(
              top: 800,
              left: 50,
              right: 0,
              child: Row(
                children: [
                  Text(
                    'Don’t have an Account? ',
                    style: UiHelper.blackTextFeildStyle(),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupPage()));
                    },
                    child: Text(
                      'Create now.',
                      style: UiHelper.blueTextFeildStyle(),
                    ),
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
