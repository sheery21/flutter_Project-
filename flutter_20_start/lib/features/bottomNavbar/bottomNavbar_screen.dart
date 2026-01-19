import 'package:flutter/material.dart';
import 'package:flutter_20_start/pages/calls/call_page.dart';
import 'package:flutter_20_start/pages/contacts/contact_page.dart';
import 'package:flutter_20_start/pages/message/message_page.dart';
import 'package:flutter_20_start/pages/settings/setting_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomnavbarScreen extends StatefulWidget {
  const BottomnavbarScreen({super.key});

  @override
  State<BottomnavbarScreen> createState() => _BottomnavbarScreenState();
}

class _BottomnavbarScreenState extends State<BottomnavbarScreen> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  List<Widget> pages = [
    MessagePage(),
    CallPage(),
    ContactPage(),
    SettingPage(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEFAF8),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Color(0xFF24786D),
        unselectedItemColor: Color(0xFF797C7B),
        backgroundColor: Color(0xFFEEFAF8),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Icon(Icons.message_outlined, size: 30),
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Icon(FontAwesomeIcons.phone, size: 30),
            ),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Icon(FontAwesomeIcons.circleUser, size: 30),
            ),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Icon(Icons.settings, size: 30),
            ),
            label: 'Settings',
          ),
        ],
      ),
      body: IndexedStack(children: pages, index: currentIndex),
    );
  }
}
