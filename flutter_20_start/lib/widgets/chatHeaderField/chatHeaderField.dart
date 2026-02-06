import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_20_start/providers/user_Provider.dart';
import 'package:provider/provider.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: userProvider != null
                  ? NetworkImage(userProvider.imageUrl!)
                  : const AssetImage("assets/default_profile.png"),
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                Text(userProvider != null ? userProvider.name! : "User Name"),
                Text(
                  userProvider.isOnline ? " (Online)" : " (Offline)",
                  style: TextStyle(
                    fontSize: 12,
                    color: userProvider.isOnline ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
