import 'package:donation_drive/widgets/AppInfoCard/appInfoCard.dart';
import 'package:donation_drive/widgets/ProfileCard/profileCard.dart';
import 'package:donation_drive/widgets/TextStyleField/headingField.dart';
import 'package:donation_drive/widgets/TextStyleField/textField.dart';
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
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Profile", style: TextStyleField.Heading_2()),
              Text(
                "Manage your account",
                style: TextStyle(color: Color(0xFF6A7282), fontSize: 14),
              ),
            ],
          ),
        ),
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
