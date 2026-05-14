import 'package:donation_drive/Pages/DashBoardPage/DashBoardPage.dart';
import 'package:donation_drive/Pages/ProfilePage/profilePage.dart';
import 'package:donation_drive/Pages/QR_SheetPage/QR_SheetPage.dart';
import 'package:donation_drive/Pages/ScanPage/scanPage.dart';
import 'package:donation_drive/Pages/TokensPage/tokensPage.dart';
import 'package:donation_drive/features/BottomNavbar/bottomNavbar.dart';
import 'package:donation_drive/features/SplasScreen/splasScreen.dart';
import 'package:donation_drive/features/authScreens/logIn_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // try {
  //   await dotenv.load(fileName: ".env");
  //   print("ENV Loaded Successfully");
  // } catch (e) {
  //   print("ENV ERROR: $e");
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "/logIn",
      getPages: [
        // GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: "/logIn", page: () => const LoginScreen()),
        GetPage(name: "/dashboard", page: () => const Dashboardpage()),
        GetPage(name: "/BottomNavbar", page: () => Bottomnavbar()),
        GetPage(name: "/Profile", page: () => const Profilepage()),
        GetPage(name: "/QR_Sheet", page: () => QrSheetpage()),
        GetPage(name: "/Tokens", page: () => const Tokenspage()),
        GetPage(name: "/Scan", page: () => const Scanpage()),
      ],
    );
  }
}
