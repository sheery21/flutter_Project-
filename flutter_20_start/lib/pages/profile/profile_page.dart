import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 👈 wapas MessagePage
          },
        ),
        title: Text("Profile"),
      ),
      body: Container(
        width: MediaQuery.of( context).size.width,
        height: MediaQuery.of( context).size.height,
        color:  Colors.purple,
        child: Center(
          child: Text("Profile Page"),
        ),
      ),
    );
  }
}