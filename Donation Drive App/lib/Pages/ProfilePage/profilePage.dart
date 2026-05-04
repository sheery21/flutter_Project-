import 'package:donation_drive/widgets/AppInfoCard/appInfoCard.dart';
import 'package:donation_drive/widgets/ProfileCard/profileCard.dart';
import 'package:donation_drive/widgets/profileOptionsCard.dart';
import 'package:flutter/material.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ProfileCard(),
            SizedBox(height: 16),
            ProfileOptionsCard(),
            SizedBox(height: 16),
            AppInfoCard(),
          ],
        ),
      ),
    );
  }
}
