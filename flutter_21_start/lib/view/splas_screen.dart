import 'package:flutter/material.dart';
import 'package:flutter_21_start/data/app_expceptions.dart';

class SplasScreen extends StatelessWidget {
  const SplasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          throw InternetExcepion("hello");
        },
      ),
    );
  }
}
