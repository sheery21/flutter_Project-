import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfoCard extends StatefulWidget {
  const AppInfoCard({super.key});

  @override
  State<AppInfoCard> createState() => _AppInfoCardState();
}

class _AppInfoCardState extends State<AppInfoCard> {
  String version = '';
  String buildNumber = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAppINfo();
  }

  Future<void> loadAppINfo() async {
    final info = await PackageInfo.fromPlatform();

    setState(() {
      version = info.version;
      buildNumber = info.buildNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "App Information",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Version"),
              Text(
                version.isEmpty ? "Loading..." : version,
                style: TextStyle(
                  color: Color(0xFF030213),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Inter",
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Build"),
              Text(
                buildNumber.isEmpty ? "Loading..." : buildNumber,
                style: TextStyle(
                  color: Color(0xFF030213),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Inter",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
