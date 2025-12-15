import 'package:flutter/material.dart';
import 'package:flutter_12_start/screens/NewPassword/newpassword.dart';
import 'package:flutter_12_start/widgets/uihelpar.dart';

class Sendotp extends StatefulWidget {
  const Sendotp({super.key});

  @override
  State<Sendotp> createState() => _SendotpState();
}

class _SendotpState extends State<Sendotp> {
  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();
  TextEditingController number3Controller = TextEditingController();
  TextEditingController number4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Center(
              child: UiHelper.CustomImage(
                imagePath: 'Capa_1.png',
                height: MediaQuery.of(context).size.height,
              ),
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
                        'We Have sent an OTP to',
                        style: UiHelper.boldBlueTextFeildStyle(),
                      ),
                    ),
                    Center(
                      child: Text(
                        ' your Mobile',
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UiHelper.CustomBoxField(
                            controller: number1Controller,
                            tohide: false,
                          ),
                          UiHelper.CustomBoxField(
                            controller: number2Controller,
                            tohide: false,
                          ),
                          UiHelper.CustomBoxField(
                            controller: number3Controller,
                            tohide: false,
                          ),
                          UiHelper.CustomBoxField(
                            controller: number4Controller,
                            tohide: false,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Center(
                      child: UiHelper.CustomButton(
                        callback: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Newpassword(),
                            ),
                          );
                        },
                        buttonName: 'Confirm',
                      ),
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
