import 'package:donation_drive/widgets/GenerateQRHeader/generateQRHeader.dart';
import 'package:donation_drive/widgets/GenerateQRHeader/genrateTokenCard.dart';
import 'package:flutter/material.dart';

class Tokenspage extends StatefulWidget {
  const Tokenspage({super.key});

  @override
  State<Tokenspage> createState() => _TokenspageState();
}

class _TokenspageState extends State<Tokenspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          GenerateQRHeader(total: 5000, active: 875, delivered: 1750),
          GenerateTokenCard(
            title: "Awan Distribution x Tuba Foundation",
            subtitle: "Tokens TD-0001 to TD-0500",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
