import 'package:flutter/material.dart';
import 'package:flutter_12_start/screens/Login/loginPage.dart';

import '../../widgets/uihelpar.dart';

class Newpassword extends StatefulWidget {
  const Newpassword({super.key});

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    Center(
                      child: UiHelper.CustomImage(
                        imagePath: 'Group-59.png',
                        height: 180,
                        width: 180,
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Text(
                        'Reset Password',
                        style: UiHelper.boldBlueTextFeildStyle(),
                      ),
                    ),
                    SizedBox(height: 17),
                    Center(
                      child: Text(
                        'Please enter your email to receive a',
                        style: UiHelper.blackTextFeildStyle(),
                      ),
                    ),
                    Center(
                      child: Text(
                        'link to create a new password via email',
                        style: UiHelper.blackTextFeildStyle(),
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: UiHelper.LabelTextFeildStyle(),
                          ),
                          UiHelper.CustomTextField(
                            controller: passwordController,
                            text: '*********',
                            tohide: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Confirm Password',
                            style: UiHelper.LabelTextFeildStyle(),
                          ),
                          UiHelper.CustomTextField(
                            controller: confirmPasswordController,
                            text: '*********',
                            tohide: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    UiHelper.CustomButton(
                      callback: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      buttonName: 'Send',
                    ),
                    SizedBox(height: 30),
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
