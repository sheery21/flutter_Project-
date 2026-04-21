import 'package:donation_drive/Pages/DashBoardPage/DashBoardPage.dart';
import 'package:donation_drive/Pages/ProfilePage/profilePage.dart';
import 'package:donation_drive/Pages/QR_SheetPage/QR_SheetPage.dart';
import 'package:donation_drive/Pages/ScanPage/scanPage.dart';
import 'package:donation_drive/Pages/TokensPage/tokensPage.dart';
import 'package:donation_drive/widgets/ColorsField/ColorField.dart';
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
        selectedItemColor: ColorsField.MainColorField(),
        unselectedItemColor: Color(0xFF99A1AF),
        // backgroundColor: Color(0xFFEEFAF8),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              color: currentIndex == 0
                  ? ColorsField.MainColorField()
                  : Color(0xFF99A1AF),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.ticket,
              color: currentIndex == 1
                  ? ColorsField.MainColorField()
                  : Color(0xFF99A1AF),
            ),
            label: "Tokens",
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorsField.MainColorField(),
            icon: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorsField.MainColorField(),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Icon(Icons.qr_code_scanner, color: Color(0xFF99A1AF)),
            ),
            label: "Scan",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code,
              color: currentIndex == 3
                  ? ColorsField.MainColorField()
                  : Color(0xFF99A1AF),
            ),
            label: "QR",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: currentIndex == 4
                  ? ColorsField.MainColorField()
                  : Color(0xFF99A1AF),
            ),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
