import 'package:donation_drive/Pages/DashBoardPage/DashBoardPage.dart';
import 'package:flutter/material.dart';

class AdminLayout extends StatefulWidget {
  const AdminLayout({super.key});

  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  int selectedIndex = 0;

  final pages = [
    Dashboardpage(),
    Center(child: Text("Donations")),
    Center(child: Text("Donors")),
    Center(child: Text("Analytics")),
    Center(child: Text("Settings")),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Color(0xFF1E5EFF),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),

                  Text(
                    "Donation Drive",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),

                  SizedBox(height: 5),

                  Text("Admin Portal", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          ),

          SizedBox(height: 30),

          sidebarItem(Icons.home, "Dashboard", 0),
          sidebarItem(Icons.card_giftcard, "Donations", 1),
          sidebarItem(Icons.people, "Donors", 2),
          sidebarItem(Icons.show_chart, "Analytics", 3),

          Divider(color: Colors.white38),

          sidebarItem(Icons.settings, "Settings", 4),
        ],
      ),
    );
  }

  Widget sidebarItem(IconData icon, String title, int index) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFEFF6FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Color(0xFF1E5EFF) : Color(0xFF364153)),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Color(0xFF1E5EFF) : Color(0xFF364153),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
