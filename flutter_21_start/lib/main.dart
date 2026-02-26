import 'package:flutter/material.dart';
import 'package:flutter_21_start/home_screen.dart';
import 'package:flutter_21_start/languages.dart';
import 'package:flutter_21_start/screen_one.dart';
import 'package:flutter_21_start/screen_two.dart';
import 'package:flutter_21_start/view/splas_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: Locale("en", "US"),
      // fallbackLocale: Locale("en" , "US"),
      translations: Languages(),

      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: const SplasScreen(),
      getPages: [
        GetPage(name: "/", page: () => HomeScreen()),
        GetPage(name: "/screen_One", page: () => ScreenOne()),
        GetPage(name: "/screen_Two", page: () => ScreenTwo()),
      ],
    );
  }
}
