import 'package:donation_drive/features/Model/QRTokenModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class QRController extends GetxController {
  var qrList = <QrTokenmodel>[].obs;
  var filteredList = <QrTokenmodel>[].obs;

  var selectedCampaign = "".obs;
  var selectedStatus = "".obs;
  var searchText = "".obs;

  final campaigns = ["Awam x Tuba Foundation", "Awan x FGRF"];
  final status = ["Unregistered", "Expired", "Active", "Delivered"];

  int _currentLimit = 10;

  @override
  void onInit() {
    super.onInit();
    generateQrTokens();
  }

  void generateQrTokens() {
    qrList.clear();

    for (int i = 1; i <= 50; i++) {
      qrList.add(
        QrTokenmodel(
          serialNumber: "${i.toString().padLeft(4, "0")}",
          campaign: campaigns[i % campaigns.length],
          status: status[i % status.length],
          generatedData: DateTime(2026, 2, 26, 18, 1),
        ),
      );
    }

    applyFilter(reset: true);
  }

  void applyFilter({bool reset = false}) {
    if (reset) _currentLimit = 10;

    List<QrTokenmodel> temp = qrList.where((item) {
      final matchCampaign =
          selectedCampaign.value.isEmpty ||
          item.campaign == selectedCampaign.value;

      final matchStatus =
          selectedStatus.value.isEmpty || item.status == selectedStatus.value;

      final matchSearch =
          searchText.value.isEmpty ||
          item.serialNumber.toLowerCase().contains(
            searchText.value.toLowerCase(),
          ) ||
          item.campaign.toLowerCase().contains(searchText.value.toLowerCase());

      return matchCampaign && matchStatus && matchSearch;
    }).toList();

    filteredList.assignAll(temp.take(_currentLimit).toList());
  }

  void loadMore() {
    _currentLimit += 10;

    List<QrTokenmodel> temp = qrList.where((item) {
      final matchCampaign =
          selectedCampaign.value.isEmpty ||
          item.campaign == selectedCampaign.value;

      final matchStatus =
          selectedStatus.value.isEmpty || item.status == selectedStatus.value;

      final matchSearch =
          searchText.value.isEmpty ||
          item.serialNumber.toLowerCase().contains(
            searchText.value.toLowerCase(),
          ) ||
          item.campaign.toLowerCase().contains(searchText.value.toLowerCase());

      return matchCampaign && matchStatus && matchSearch;
    }).toList();

    filteredList.assignAll(temp.take(_currentLimit).toList());
  }
}
