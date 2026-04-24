import 'package:get/get.dart';

class DashboardController extends GetxController {
  // Loading
  var isLoading = true.obs;

  // Token Summary
  var totalTokens = 0.obs;
  var unregistered = 0.obs;
  var registered = 0.obs;
  var delivered = 0.obs;

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
      "color": 0xFF4A3AFF,
      "icon": "assets/Icons/Tokens.svg",
    },
    {
      "title": "Delivered",
      "value": delivered.value,
      "color": 0xFF00C853,
      "icon": "assets/Icons/Delivered.svg",
    },
    {
      "title": "Registered",
      "value": registered.value,
      "color": 0xFF2962FF,
      "icon": "assets/Icons/Registered.svg",
    },
    {
      "title": "Unregistered",
      "value": unregistered.value,
      "color": 0xFFFF6D00,
      "icon": "assets/Icons/Unregistered.svg",
    },
  ];

  void fetchFakeData() async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    totalTokens.value = 3500;
    unregistered.value = 2024;
    registered.value = 93;
    delivered.value = 1383;

    campaigns.assignAll([
      {
        "title": "Awam Distribution x Tuba \nFoundation",
        "total": 500,
        "unregistered": 318,
        "registered": 25,
        "delivered": 157,
      },
      {
        "title": "Awan Distribution x FGRF",
        "total": 1706,
        "unregistered": 68,
        "registered": 1226,
        "delivered": 26,
      },
    ]);

    isLoading.value = false;
  }
}
