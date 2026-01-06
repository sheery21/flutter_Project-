import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_20_start/features/screen/story_preview_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator/palette_generator.dart';

class Addstoryfield extends StatefulWidget {
  final String imageUrl;
  final bool hasStory;
  final VoidCallback onOpenStory;
  final Function(String imageUrl) onStoryAdded;

  const Addstoryfield({
    super.key,
    required this.imageUrl,
    required this.hasStory,
    required this.onOpenStory,
    required this.onStoryAdded,
  });

  @override
  State<Addstoryfield> createState() => _AddstoryfieldState();
}

class _AddstoryfieldState extends State<Addstoryfield> {
  final ImagePicker _picker = ImagePicker();
  Color borderColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  @override
  void didUpdateWidget(covariant Addstoryfield oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUrl != widget.imageUrl && widget.hasStory) {
      _updatePalette();
    }
  }

  Future<void> _updatePalette() async {
    if (!widget.hasStory) return;

    final palette = await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.imageUrl),
    );

    setState(() {
      borderColor = palette.dominantColor?.color ?? Colors.grey;
    });
  }

  Future<void> _pick(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => StoryPreviewScreen(
          imageFile: File(image.path),
          onStoryAdded: widget.onStoryAdded,
        ),
      ),
    );
  }

  void _showOptions() {
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
              _pick(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text("Gallery"),
            onTap: () {
              Navigator.pop(context);
              _pick(ImageSource.gallery);
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
            onTap: widget.onOpenStory, // avatar tap → story open
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                // 🔥 FRIEND-LIKE DYNAMIC BORDER
                Container(
                  padding: EdgeInsets.all(widget.hasStory ? 3 : 0),
                  decoration: widget.hasStory
                      ? BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [borderColor.withOpacity(0.5), borderColor],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        )
                      : null,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: CircleAvatar(
                      radius: 36,
                      backgroundImage: NetworkImage(widget.imageUrl),
                    ),
                  ),
                ),

                // ➕ ADD BUTTON (separate tap)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _showOptions,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          const Text("Your Story"),
        ],
      ),
    );
  }
}
