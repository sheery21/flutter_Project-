import 'package:flutter/material.dart';

class Navbarfield {
  static PreferredSizeWidget mainNavbar({
    required VoidCallback onMenuTap,
    required VoidCallback onBellTap,
  }) {
    return AppBar(
      elevation: 0,
      leadingWidth: 70,
      // 🔹 Left icon (sidebar)
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
          icon: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Icon(Icons.menu, color: Colors.black),
          ),
          onPressed: onMenuTap,
        ),
      ),

      // 🔹 Title (center)
      centerTitle: true,
      title: Text(
        "Dashboard",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),

      // 🔹 Right icon (bell)
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Icon(Icons.notifications_none, color: Colors.black),
            ),
            onPressed: onBellTap,
          ),
        ),
      ],
    );
  }
}
