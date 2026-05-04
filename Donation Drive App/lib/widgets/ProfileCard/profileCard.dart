import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {

  final TextEditingController emailController =
  TextEditingController(text: "manager@donatetrack.org");

  final TextEditingController roleController =
  TextEditingController(text: "Field Officer");

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.blueAccent,
                child: const Icon(Icons.person,
                    size: 30, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Field Manager",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text("Active",
                      style: TextStyle(color: Colors.green)),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Email TextField
          Row(
            children: [
              const Icon(Icons.email_outlined,
                  size: 20, color: Colors.grey),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: InputBorder.none,

                  ),
                  style: const TextStyle(
                    color: Color(0xFF030213),
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Inter",
                  ),
                ),
              ),
            ],
          ),


          const Divider(
            color: Color(0xFFF3F4F6),
            thickness: 1,
            height: 20,
          ),

          // Role TextField
          Row(
            children: [
              const Icon(Icons.person_outline,
                  size: 20, color: Colors.grey),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: roleController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "Role",
                      ),
                      style: const TextStyle(
                        color: Color(0xFF030213),
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
