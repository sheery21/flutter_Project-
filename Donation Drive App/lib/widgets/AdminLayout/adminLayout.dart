import 'package:donation_drive/Pages/DashBoardPage/DashBoardPage.dart';
import 'package:donation_drive/features/Controllers/NavigationController/navigationController.dart';
import 'package:donation_drive/widgets/ButtonsField/buttonField.dart';
import 'package:donation_drive/widgets/ButtonsField/logOutButtonField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminLayout extends StatefulWidget {
  const AdminLayout({super.key});

  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  // Controller ko find karein
  final NavigationController navRepo = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // 🔵 HEADER SECTION (ADD THIS)
          Container(
            width: double.infinity,
            height: 120,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1E5EFF), Color(0xFF2563EB)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text Section
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Donation Drive",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Admin Portal",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ],
                  ),
                ),

                // Close Button
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.close, color: Colors.white, size: 26),
                ),
              ],
            ),
          ),

          // 👇 your existing menu
          Obx(
            () => Column(
              children: [
                sidebarItem(const Icon(Icons.home), "Home", 0),
                sidebarItem(const FaIcon(FontAwesomeIcons.ticket), "Tokens", 1),
                sidebarItem(const Icon(Icons.qr_code_scanner), "Scan", 2),
                sidebarItem(const Icon(Icons.qr_code), "QR", 3),
                sidebarItem(const Icon(Icons.person), "Profile", 4),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Divider(color: Colors.grey[300], thickness: 1),
          ),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Get.offAllNamed("/logIn");
            },
          ),
        ],
      ),
    );
  }

  Widget sidebarItem(Widget icon, String title, int index) {
    // Controller se current index match karein
    bool isSelected = navRepo.currentIndex.value == index;

    return GestureDetector(
      onTap: () {
        navRepo.changeIndex(index); // Index change karo
        Get.back(); // Sidebar/Drawer ko close karo
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEFF6FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // Icon color update logic
            IconTheme(
              data: IconThemeData(
                color: isSelected
                    ? const Color(0xFF1E5EFF)
                    : const Color(0xFF99A1AF),
              ),
              child: icon,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? const Color(0xFF1E5EFF)
                    : const Color(0xFF364153),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
