import 'package:donation_drive/widgets/NavbarField/navBarField.dart';
import 'package:donation_drive/widgets/TokenSummaryFirld/tokenSummaryFirld.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Dashboardpage extends StatefulWidget {
  const Dashboardpage({super.key});

  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbarfield.mainNavbar(
        onMenuTap: () {
          print("hello");
        },
        onBellTap: () {
          print("hello");
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                TokenSummaryCard(
                  title: "Total Tokens",
                  value: 700,
                  subtitle: "Tap to view details",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
