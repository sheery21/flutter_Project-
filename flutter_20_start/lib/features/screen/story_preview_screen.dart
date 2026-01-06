import 'package:flutter/material.dart';
import 'package:flutter_20_start/data/story_data.dart';
import 'package:flutter_20_start/models/story_models.dart';
import 'package:flutter_20_start/services/cloudinary_service.dart';

class StoryPreviewScreen extends StatefulWidget {
  final imageFile;
  final Function(String) onStoryAdded;
  const StoryPreviewScreen({
    super.key,
    required this.imageFile,
    required this.onStoryAdded,
  });

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

    widget.onStoryAdded(imageUrl);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.file(widget.imageFile, fit: BoxFit.cover),
          ),

          if (!_isUploading)
            Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                icon: const Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: _addStory,
              ),
            ),

          if (_isUploading)
            const Center(child: CircularProgressIndicator(color: Colors.white)),
        ],
      ),
    );
  }
}
