import 'package:donation_drive/Pages/DashBoardPage/DashBoardPage.dart';
import 'package:donation_drive/Pages/ProfilePage/profilePage.dart';
import 'package:donation_drive/Pages/QR_SheetPage/QR_SheetPage.dart';
import 'package:donation_drive/Pages/ScanPage/scanPage.dart';
import 'package:donation_drive/Pages/TokensPage/tokensPage.dart';
import 'package:donation_drive/features/BottomNavbar/bottomNavbar.dart';
import 'package:donation_drive/features/authScreens/logIn_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginScreen(),
        "/dashboard": (context) => const Dashboardpage(),
        "/BottomNavbar": (context) => const Bottomnavbar(),
        "/Profile": (context) => const Profilepage(),
        "/QR_Sheet": (context) => const QrSheetpage(),
        "/Tokens": (context) => const Tokenspage(),
        "/Scan": (context) => const Scanpage(),
      },
    );
  }
}
