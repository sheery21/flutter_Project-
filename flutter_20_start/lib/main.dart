import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_20_start/features/auth/screens/login_screens.dart';
import 'package:flutter_20_start/features/auth/screens/signup_screens.dart';
import 'package:flutter_20_start/features/bottomNavbar/bottomNavbar_screen.dart';
import 'package:flutter_20_start/features/home/home_screen.dart';
import 'package:flutter_20_start/features/splashscreen/splashscreen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) =>  Splashscreen(),
        "/bottomNav": (context) =>  BottomnavbarScreen(),
        "/login": (context) => LoginScreens(),
        "/signup": (context) => SignupScreens(),
        "/home": (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}