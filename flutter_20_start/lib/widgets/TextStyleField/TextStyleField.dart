import 'package:flutter/widgets.dart';

class Textstylefield {
  // Welcome Back Text Style
  static TextStyle Custom_WelcomeBack_TextStyleField() {
    return const TextStyle(
      fontFamily: "Hurricane",
      color: Color(0xFF000000),
      fontSize: 65,
      fontWeight: FontWeight.w900,
      shadows: [
        Shadow(color: Color(0xFF7D7763), offset: Offset(2, 2), blurRadius: 4),
      ],
    );
  }

  //  Welcome Back 2 Text Style
  static TextStyle Custom_WelcomeBack_2_TextStyleField() {
    return const TextStyle(
      fontFamily: "IbarraRealNova",
      color: Color(0xFF000000),
      fontSize: 22,
      fontWeight: FontWeight.w900,
      shadows: [
        Shadow(color: Color(0xFFC2B071), offset: Offset(2, 2), blurRadius: 4),
      ],
    );
  }

  // Login & SingUp Text Style
  static TextStyle Custom_LogInSignUp_TextStyleField() {
    return const TextStyle(
      fontFamily: "IbarraRealNova",
      color: Color(0xFF1A5D1A),
      fontSize: 45,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(color: Color(0xFF7D7763), offset: Offset(2, 2), blurRadius: 4),
      ],
    );
  }

  // Short Text Style
  static TextStyle Custom_ShortText_TextStyleField() {
    return const TextStyle(
      fontFamily: "IbarraRealNova",
      color: Color(0xFF1A5D1A),
      fontSize: 45,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(color: Color(0xFF7D7763), offset: Offset(2, 2), blurRadius: 4),
      ],
    );
  }

  // Short Or LogIn with Text Style
  static TextStyle Custom_Or_LogIn_Text_TextStyleField() {
    return const TextStyle(
      fontFamily: "Poppins",
      color: Color(0xFF7D7763),
      fontSize: 15,
      fontWeight: FontWeight.bold,
    );
  }

  // Short have an account Text Style
  static TextStyle Custom_an_accontText_TextStyleField() {
    return const TextStyle(
      fontFamily: "IbarraRealNova",
      color: Color(0xFF000000),
      fontSize: 45,
      fontWeight: FontWeight.bold,
    );
  }
}
