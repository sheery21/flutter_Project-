import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TokenAnalyticsCard extends StatelessWidget {
  final int unregistered;
  final int registered;
  final int delivered;

  const TokenAnalyticsCard({
    super.key,
    required this.unregistered,
    required this.registered,
    required this.delivered,
  });

  String formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => ",",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            "Token Analytics",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),

          SizedBox(height: 16),

          // Content Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 🔵 Donut Chart Placeholder
              SizedBox(
                height: 100,
                width: 100,
                child: PieChart(
                  PieChartData(
                    startDegreeOffset: -90,
                    sectionsSpace: 1,
                    centerSpaceRadius: 30,
                    sections: [
                      PieChartSectionData(
                        color: Colors.orange,
                        value: unregistered.toDouble(),
                        showTitle: false,
                        radius: 20,
                      ),
                      PieChartSectionData(
                        color: Colors.green,
                        value: registered.toDouble(),
                        showTitle: false,
                        radius: 20,
                      ),
                      PieChartSectionData(
                        color: Colors.grey,
                        value: delivered.toDouble(),
                        showTitle: false,
                        radius: 20,
                      ),
                    ],
                  ),
                ),
              ),

              // 🔹 Legend
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLegend(
                    color: Colors.orange,
                    title: "Unregistered",
                    value: formatNumber(unregistered),
                  ),
                  SizedBox(height: 8),
                  _buildLegend(
                    color: Colors.green,
                    title: "Registered",
                    value: formatNumber(registered),
                  ),
                  SizedBox(height: 8),
                  _buildLegend(
                    color: Colors.grey,
                    title: "Delivered",
                    value: formatNumber(delivered),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 🔹 Legend Widget
  Widget _buildLegend({
    required Color color,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 8),
        Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
        SizedBox(width: 10),
        Text(
          value,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
