import 'package:donation_drive/Pages/QrDetailPage/QrDetailPage.dart';
import 'package:donation_drive/features/Controllers/QR_Controller.dart';
import 'package:donation_drive/widgets/QrCardField/QrCardField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrGridPagination extends StatefulWidget {
  const QrGridPagination({super.key});

  @override
  State<QrGridPagination> createState() => _QrGridPaginationState();
}

class _QrGridPaginationState extends State<QrGridPagination> {
  final QRController controller = Get.find();

  int page = 0;
  final int limit = 10;

  List get currentPageData {
    final data = controller.getFilteredData();

    int start = page * limit;
    int end = start + limit;

    if (start >= data.length) return [];

    return data.sublist(start, end > data.length ? data.length : end);
  }

  void nextPage() {
    final total = controller.getFilteredData().length;

    if ((page + 1) * limit < total) {
      setState(() {
        page++;
      });
    }
  }

  void prevPage() {
    if (page > 0) {
      setState(() {
        page--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// GRID
          Obx(() {
            final data = currentPageData;

            return GridView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              itemCount: data.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.80,
              ),
              itemBuilder: (context, index) {
                final item = data[index];

                return GestureDetector(
                  onTap: () {
                    Get.to(
                      () => QrDetailPage(data: item, campaign: item.campaign),
                    );
                  },
                  child: QrCardField(data: item),
                );
              },
            );
          }),

          const SizedBox(height: 10),

          /// PAGINATION CONTROLS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: page > 0 ? prevPage : null,
                child: const Text("Previous"),
              ),
              Text("Page ${page + 1}"),
              ElevatedButton(
                onPressed:
                    ((page + 1) * limit < controller.getFilteredData().length)
                    ? nextPage
                    : null,
                child: const Text("Next"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
