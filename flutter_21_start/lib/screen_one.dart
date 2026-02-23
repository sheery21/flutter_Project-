import 'package:flutter/material.dart';
import 'package:flutter_21_start/home_screen.dart';
import 'package:flutter_21_start/screen_two.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class ScreenOne extends StatefulWidget {
  var name;
   ScreenOne({super.key, this.name});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen one ${Get.arguments[1]}")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                Get.to(ScreenTwo());
              },
              child: Text("Go To Next Screen"),
            ),
          ),
        ],
      ),
    );
  }
}
