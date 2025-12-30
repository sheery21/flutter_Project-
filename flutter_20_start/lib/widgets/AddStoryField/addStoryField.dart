import 'package:flutter/material.dart';

class Addstoryfield extends StatelessWidget {

final VoidCallback onTap;
final String imageUrl;

const Addstoryfield({super.key, required this.onTap, required this.imageUrl});

@override
  Widget build(BuildContext context) {
    return GestureDetector(
onTap: onTap,
child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
   child: Column(
    children: [
      Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(radius: 36,
          backgroundImage: NetworkImage(imageUrl),
          ),
          Container(
            decoration: const
            BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            padding: const EdgeInsets.all(3),
            child: const Icon(Icons.add, color: Colors.white, size: 20,
          )
          )
        ],
      ),
      const SizedBox(height: 6),
      const Text("Add Story", style: TextStyle(fontSize: 16)),
    ],
   ),
),
    );
  }

}