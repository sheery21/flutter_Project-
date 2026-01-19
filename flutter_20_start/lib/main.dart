import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_20_start/features/auth/screens/login_screens.dart';
import 'package:flutter_20_start/features/auth/screens/signup_screens.dart';
import 'package:flutter_20_start/features/bottomNavbar/bottomNavbar_screen.dart';
import 'package:flutter_20_start/features/splashscreen/splashscreen.dart';
import 'package:flutter_20_start/onboarding/Onboarding_page.dart';
import 'package:flutter_20_start/pages/calls/call_page.dart';
import 'package:flutter_20_start/pages/contacts/contact_page.dart';
import 'package:flutter_20_start/pages/message/message_page.dart';
import 'package:flutter_20_start/pages/profile/profile_page.dart';
import 'package:flutter_20_start/pages/search/search_page.dart';
import 'package:flutter_20_start/pages/settings/setting_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_20_start/providers/user_Provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    await dotenv.load(fileName: ".env" );
  } catch (e) {
    debugPrint("⚠️ .env file not found, continuing without it"
    );
  }
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyWidget(),
    ),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => Splashscreen(),
        "/onboarding": (context) => OnboardingPage(),
        "/bottomNav": (context) => BottomnavbarScreen(),
        "/login": (context) => LoginScreens(),
        "/signup": (context) => SignupScreens(),
        "message": (context) => MessagePage(),
        "contact": (context) => ContactPage(),
        "call": (context) => CallPage(),
        "profile": (context) => ProfilePage(),
        "settings": (context) => SettingPage(),
        "search": (context) => SearchPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
