import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_20_start/providers/user_Provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ChatHeader extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String imageUrl;
  final bool isOnline;

  const ChatHeader({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
  });

  @override
  Size get preferredSize => const Size.fromHeight(120);
  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        toolbarHeight: 160,
        title: Row(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: userProvider != null
                          ? NetworkImage(userProvider.imageUrl!)
                          : const AssetImage("assets/default_profile.png")
                                as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: isOnline ? Colors.green : Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(name, style: const TextStyle(color: Colors.black)),
                    SizedBox(height: 2),
                    Text(
                      isOnline ? "Active now" : "Offline",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.phone_outlined,
                    size: 30,
                    color: Colors.black87,
                  ),
                  onPressed: () {
                    // Handle voice call action
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.videocam_outlined,
                    size: 30,
                    color: Colors.black87,
                  ),
                  onPressed: () {
                    // Handle video call action
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
