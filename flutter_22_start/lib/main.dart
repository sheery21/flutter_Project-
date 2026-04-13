import 'dart:nativewrappers/_internal/vm/lib/async_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_22_start/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.flutter_dash, size: 80),
          SizedBox(height: 20),
          Text("My App", style: TextStyle(fontSize: 26)),
        ],
      ),
    );
  }
}
