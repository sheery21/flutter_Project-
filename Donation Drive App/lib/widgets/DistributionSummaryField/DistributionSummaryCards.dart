import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DistributionSummaryCard extends StatelessWidget {
  final String title;
  final String subtitle;

  final int unregistered;
  final int registered;
  final int delivered;

  const DistributionSummaryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.unregistered,
    required this.registered,
    required this.delivered,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width / 1.1,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/Icons/users.svg", width: 45, height: 45),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 4),

          /// Subtitle
          const SizedBox(height: 16),

          /// Status Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              _statusBox(
                "Unregistered",
                unregistered,
                const Color(0xFFFFF1EB),
                Colors.orange,
              ),
              _statusBox(
                "Registered",
                registered,
                const Color(0xFFE8F8EE),
                Colors.green,
              ),
              _statusBox(
                "Delivered",
                delivered,
                const Color(0xFFF2F2F2),
                Colors.black54,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statusBox(String label, int value, Color bgColor, Color textColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "$value",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
