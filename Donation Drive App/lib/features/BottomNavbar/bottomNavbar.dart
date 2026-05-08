import 'package:donation_drive/Pages/DashBoardPage/DashBoardPage.dart';
import 'package:donation_drive/Pages/ProfilePage/profilePage.dart';
import 'package:donation_drive/Pages/QR_SheetPage/QR_SheetPage.dart';
import 'package:donation_drive/Pages/ScanPage/scanPage.dart';
import 'package:donation_drive/Pages/TokensPage/tokensPage.dart';
import 'package:donation_drive/features/Controllers/NavigationController/navigationController.dart';
import 'package:donation_drive/widgets/AdminLayout/adminLayout.dart'; // Import AdminLayout
import 'package:donation_drive/widgets/ColorsField/ColorField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
// import '../../features/Controllers/navigation_controller.dart'; // Path sahi kar lena

class Bottomnavbar extends StatelessWidget {
  Bottomnavbar({super.key});

  final NavigationController navRepo = Get.put(NavigationController());

  final List<Widget> pages = [
    Dashboardpage(),
    Tokenspage(),
    Scanpage(),
    QrSheetpage(),
    Profilepage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // Drawer yahan shift kar diya taaki ye har page pe chale
        drawer: const AdminLayout(),
        body: pages[navRepo.currentIndex.value],
        backgroundColor: const Color(0xFFEEFAF8),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navRepo.currentIndex.value,
          selectedItemColor: ColorsField.MainColorField(),
          unselectedItemColor: const Color(0xFF99A1AF),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          onTap: (index) => navRepo.changeIndex(index),
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "Dashboard",
            ),
            const BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.ticket),
              label: "Tokens",
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorsField.MainColorField(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.qr_code_scanner, color: Colors.white),
              ),
              label: "Scan",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: "QR",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
