import 'package:donation_drive/widgets/TextStyleField/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class TokenCard extends StatelessWidget {
  final String campaign;
  final String status;
  final String serial;
  final DateTime date;
  final VoidCallback onView;

  const TokenCard({
    super.key,
    required this.campaign,
    required this.status,
    required this.serial,
    required this.date,
    required this.onView,
  });

  Color getStatusColor() {
    switch (status) {
      case "Active":
        return Colors.green;
      case "Expired":
        return Colors.red;
      case "Delivered":
        return Colors.blue;
      default:
        return Colors.orange;
    }
  }

  Color getCampaignColor() {
    switch (campaign) {
      case "Awam x Tuba Foundation":
        return Colors.blue;
      case "Awan x FGRF":
        return Colors.green;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(blurRadius: 6, color: Colors.black12)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row (Campaign + Status)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: getCampaignColor().withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  campaign,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Inter",
                    color: getCampaignColor(),
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: getStatusColor().withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    color: getStatusColor(),
                    fontWeight: FontWeight.w600,
                    fontFamily: "Inter",
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// Serial
          Row(
            children: [
              SvgPicture.asset("assets/Icons/#.svg"),
              const SizedBox(width: 6),
              Text(
                serial,
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Inter",
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          /// Date
          Row(
            children: [
              SvgPicture.asset("assets/Icons/calendar.svg"),
              const SizedBox(width: 6),
              Text(
                DateFormat("dd/MM/yyyy").format(date),
                style: ShortTextField.mainShortText_3(),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                onView();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                foregroundColor: Colors.black,
                elevation: 0,
              ),
              child: const Text("View Details"),
            ),
          ),
          const SizedBox(height: 42),
        ],
      ),
    );
  }
}
