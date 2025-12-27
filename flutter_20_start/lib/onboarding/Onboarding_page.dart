import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color(0xFF1A1A1A),
        
        ),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/Logo_Chatbox.png"),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Connect friends easily & quickly",
              style: TextStyle(
                color: Colors.white,
                fontSize: 74,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],),),
    );
  }
}