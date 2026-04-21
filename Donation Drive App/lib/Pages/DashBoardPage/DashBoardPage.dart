import 'package:donation_drive/widgets/DistributionSummaryField/DistributionSummaryCards.dart';
import 'package:donation_drive/widgets/NavbarField/navBarField.dart';
import 'package:donation_drive/widgets/TokenAnalytics/TokenAnalyticsCard.dart';
import 'package:donation_drive/widgets/TokenSummaryFirld/tokenSummaryCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Dashboardpage extends StatefulWidget {
  const Dashboardpage({super.key});

  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}


class _DashboardpageState extends State<Dashboardpage> {

  // Future<TokenAnalyticsModel> fetchAnalytics() async {
  //   final response = await http.get(Uri.parse("YOUR_API_URL"));
  //
  //   final data = jsonDecode(response.body);
  //
  //   return TokenAnalyticsModel.fromJson(data);
  // }
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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              TokenSummaryCard(
                title: "Total Tokens",
                value: 700,
                subtitle: "Tap to view details",
              ),
              SizedBox(height: 20),
        
              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "By Campaingn",
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "View All",
                        style: TextStyle(
                          color: Color(0xFFF54900),
                          fontFamily: "Outfit",
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        
              SizedBox(height: 15),
              DistributionSummaryCard(
                title: "Awam Distribution x Tuba \n Foundation",
                subtitle: "500 Total",
                unregistered: 318,
                registered: 25,
                delivered: 157,
              ),
              SizedBox(height: 13),
              DistributionSummaryCard(
                title: "Awan Distribution x FGRF",
                subtitle: "500 total",
                unregistered: 1706,
                registered: 68,
                delivered: 1226,
              ),
              SizedBox(height: 13),
              // FutureBuilder<TokenAnalyticsModel>(
              //   future: fetchAnalytics(),
              //   builder: (context, snapshot) {
              //     if (!snapshot.hasData) {
              //       return CircularProgressIndicator();
              //     }
              //
              //     final data = snapshot.data!;
              //
              //     return TokenAnalyticsCard(
              //       unregistered: data.unregistered,
              //       registered: data.registered,
              //       delivered: data.delivered,
              //     );
              //   },
              // )
              TokenAnalyticsCard(
                unregistered: 124,
                registered: 93,
                delivered: 1383,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
