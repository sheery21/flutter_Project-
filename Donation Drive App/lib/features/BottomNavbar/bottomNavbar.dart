import 'package:donation_drive/Pages/DashBoardPage/DashBoardPage.dart';
import 'package:donation_drive/Pages/ProfilePage/profilePage.dart';
import 'package:donation_drive/Pages/QR_SheetPage/QR_SheetPage.dart';
import 'package:donation_drive/Pages/ScanPage/scanPage.dart';
import 'package:donation_drive/Pages/TokensPage/tokensPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {

  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }
  List<Widget> pages = [
    Dashboardpage(),
    Tokenspage(),
    Scanpage(),
    QrSheetpage(),
    Profilepage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ FIX 2 (body add kiya)
        body: pages[currentIndex],
        backgroundColor: Color(0xFFEEFAF8),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Color(0xFF24786D),
          unselectedItemColor: Color(0xFF797C7B),
          backgroundColor: Color(0xFFEEFAF8),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.ticket),
              label: "Tokens",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner),
              label: "Scan",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: "QR",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        )
    );
  }
}
