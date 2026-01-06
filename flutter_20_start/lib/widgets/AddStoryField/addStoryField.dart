import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_20_start/features/screen/story_preview_screen.dart';
import 'package:flutter_20_start/services/cloudinary_service.dart';
import 'package:image_picker/image_picker.dart';

class Addstoryfield extends StatelessWidget {
  final String imageUrl;
  final bool hasStory;
  final VoidCallback onOpenStory;
  final Function(String imageUrl) onStoryAdded;

  Addstoryfield({
    super.key,
    required this.imageUrl,
    required this.hasStory,
    required this.onOpenStory,
    required this.onStoryAdded,
  });

  final ImagePicker _picker = ImagePicker();

  Future<void> _pick(BuildContext context, ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image == null) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => StoryPreviewScreen(
          imageFile: File(image.path),
          onStoryAdded: onStoryAdded,
        ),
      ),
    );
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text("Camera"),
            onTap: () {
              Navigator.pop(context);
              _pick(context, ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text("Gallery"),
            onTap: () {
              Navigator.pop(context);
              _pick(context, ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: hasStory ? onOpenStory : () => _showOptions(context),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                if (!hasStory)
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: const Icon(Icons.add, size: 18, color: Colors.white),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(hasStory ? "Your Story" : "Add Story"),
        ],
      ),
    );
  }
}
