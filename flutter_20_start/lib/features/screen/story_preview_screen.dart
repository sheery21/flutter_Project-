import 'package:flutter/material.dart';
import 'package:flutter_20_start/data/story_data.dart';
import 'package:flutter_20_start/models/story_models.dart';
import 'package:flutter_20_start/services/cloudinary_service.dart';

class StoryPreviewScreen extends StatefulWidget {
  final imageFile;
  const StoryPreviewScreen({super.key, required this.imageFile});

  @override
  State<StoryPreviewScreen> createState() => _StoryPreviewScreenState();
}

class _StoryPreviewScreenState extends State<StoryPreviewScreen> {
  final CloudinaryService _cloudinaryService = CloudinaryService();
  bool _isUploading = false;

  Future<void> _addStory() async {
    setState(() => _isUploading = true);
    final imageUrl = await _cloudinaryService.uploadImage(widget.imageFile);
    setState(() => _isUploading = false);
    if (imageUrl == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Upload failed")));
      return;
    }
    StoryData.stories.insert(
      0,
      StoryModel(name: "My Story", image: imageUrl, isMyStory: true),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(child: Image.file(widget.imageFile, fit: BoxFit.cover)),
          Positioned(
            top: 40,
            right: 20,
            child: _isUploading
                ? const CircularProgressIndicator(color: Colors.white)
                : IconButton(
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.white,
                      size: 36,
                    ),
                    onPressed: _addStory,
                  ),
          ),
        ],
      ),
    );
  }
}
