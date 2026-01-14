import 'package:flutter/material.dart';
import 'package:flutter_20_start/providers/user_Provider.dart';
import 'package:provider/provider.dart';

class ProfileInfoField extends StatelessWidget {
  const ProfileInfoField({super.key});

  Widget buildLabelValue(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox( height: 16,),
        Text(label, style: TextStyle(color: Color(0xFF797C7B), fontSize: 18)),
        Padding(
          padding: EdgeInsetsGeometry.only(left: 8),
          child: Text(
            value,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildLabelValue("Display Name", userProvider.name ?? ""),
          buildLabelValue("Email Address", userProvider.email ?? ""),
          // buildLabelValue("Display Name", userProvider.address ?? ""),
          buildLabelValue("Phone  Number", userProvider.phoneNumber ?? ""),
        ],
      ),
    );
  }
}
