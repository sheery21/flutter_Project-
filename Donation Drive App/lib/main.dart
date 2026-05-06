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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: "/logIn",
      getPages: [
        GetPage(name: "/logIn", page: () => const LoginScreen()),
        GetPage(name: "/dashboard", page: () => const Dashboardpage()),
        GetPage(name: "/BottomNavbar", page: () => const Bottomnavbar()),
        GetPage(name: "/Profile", page: () => const Profilepage()),
        GetPage(name: "/QR_Sheet", page: () => QrSheetpage()),
        GetPage(name: "/Tokens", page: () => const Tokenspage()),
        GetPage(name: "/Scan", page: () => const Scanpage()),
      ],
    );
  }
}
