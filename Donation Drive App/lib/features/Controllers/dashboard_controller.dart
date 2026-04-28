import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  // Loading
  var isLoading = true.obs;

  // Token Summary
  var totalTokens = 0.obs;
  var unregistered = 0.obs;
  var registered = 0.obs;
  var delivered = 0.obs;
  var details = 0.obs;

  // Campaigns
  var campaigns = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFakeData();
  }

  List<Map<String, dynamic>> get tokenDetails => [
    {
      "title": "Total Tokens",
      "value": totalTokens.value,
      "color": const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF2B7FFF), Color(0xFF155DFC)],
      ),
      "icon": "assets/Icons/Tokens.svg",
    },
    {
      "title": "Unregistered",
      "value": unregistered.value,
      "color": const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFFF6900), Color(0xFFF54900)],
      ),
      "icon": "assets/Icons/Unregistered.svg",
    },
    {
      "title": "Registered",
      "value": registered.value,
      "color": const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF00C950), Color(0xFF00A63E)],
      ),
      "icon": "assets/Icons/Registered.svg",
    },
    {
      "title": "Delivered",
      "value": delivered.value,
      "color": const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF62748E), Color(0xFF45556C)],
      ),
      "icon": "assets/Icons/Delivered.svg",
    },{
      "title": "With Details",
      "value": delivered.value,
      "color": const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFAD46FF), Color(0xFF9810FA)],
      ),
      "icon": "assets/Icons/chartColumn1.svg",
    },
  ];

  void fetchFakeData() async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    totalTokens.value = 3500;
    unregistered.value = 2024;
    registered.value = 93;
    delivered.value = 1383;
    details.value = 1;
    campaigns.assignAll([
      {
        "title": "Awam Distribution x Tuba \nFoundation",
        "total": 12345,
        "unregistered": 12345,
        "registered": 12345,
        "delivered": 12345,
      },
      {
        "title": "Awan Distribution x FGRF",
        "total": 12345,
        "unregistered": 12345,
        "registered": 12345,
        "delivered": 12345,
      },
    ]);

    isLoading.value = false;
  }
}
