import 'package:donation_drive/features/Model/QRTokenModel.dart';
import 'package:get/get.dart';

class QRController extends GetxController {
  var qrList = <QrTokenmodel>[].obs;
  var filteredList = <QrTokenmodel>[].obs;

  List<QrTokenmodel> _allFiltered = [];

  void _prepareFilteredData() {
    _allFiltered = getFilteredData();
  }

  bool isPaginationMode = true;

  var selectedCampaign = "".obs;
  var selectedStatus = "".obs;
  var searchText = "".obs;

  final campaigns = ["Awam x Tuba Foundation", "Awan x FGRF"];
  final status = ["Unregistered", "Expired", "Active", "Delivered"];

  int page = 0;
  final int limit = 10;

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
          QR_Code: "QR_$i",
          generatedData: DateTime(2026, 2, 26, 18, 1),
          userName: "User $i",
          userCNIC: "42101-123456$i",
          userPhone: "0300-00000$i",
          userNumberOfPeopleInHouse: "${(i % 6) + 1}",
          userImage: "assets/images/user_Image.svg",
        ),
      );
    }

    applyFilter(reset: true);
  }

  List<QrTokenmodel> getFilteredData() {
    return qrList.where((item) {
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
  }

  QrTokenmodel? findBySerial(String serial) {
    try {
      return qrList.firstWhere((item) => item.serialNumber == serial);
    } catch (e) {
      return null;
    }
  }

  void applyFilter({bool reset = false}) {
    _allFiltered = getFilteredData();

    if (reset) {
      page = 0;
      filteredList.clear();
    }

    int start = page * limit;
    int end = start + limit;

    if (start >= _allFiltered.length) return;

    final newData = _allFiltered.sublist(
      start,
      end > _allFiltered.length ? _allFiltered.length : end,
    );

    if (isPaginationMode) {
      // ✅ GRID → replace
      filteredList.assignAll(newData);
    } else {
      // ✅ TOKENS → append
      if (reset) {
        filteredList.assignAll(newData);
      } else {
        filteredList.addAll(newData);
      }
    }
  }

  void loadNext() {
    if (isPaginationMode) {
      page++;
      applyFilter();
    } else {
      // Load More mode
      if (filteredList.length >= _allFiltered.length) {
        applyFilter(reset: true); // Show Less
      } else {
        page++;
        applyFilter();
      }
    }
  }

  void loadPrevious() {
    if (hasPrevious) {
      page--;
      applyFilter(reset: true);
    }
  }

  bool get isAllLoaded => filteredList.length >= _allFiltered.length;

  bool get hasNext {
    return (page + 1) * limit < _allFiltered.length;
  }

  bool get hasPrevious {
    return page > 0;
  }
}
