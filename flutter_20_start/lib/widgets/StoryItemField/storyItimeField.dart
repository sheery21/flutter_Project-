import 'package:flutter/material.dart';
import 'package:flutter_20_start/models/story_models.dart';
import 'package:flutter_20_start/providers/user_Provider.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

class Storyitimefield extends StatefulWidget {
  final StoryModel story;
  final VoidCallback onTap;

  const Storyitimefield({super.key, required this.story, required this.onTap});

  @override
  State<Storyitimefield> createState() => _StoryitimefieldState();
}

class _StoryitimefieldState extends State<Storyitimefield> {
  Color borderColor = Colors.grey;

  String getProfileImage(BuildContext context) {
    if (widget.story.isMyStory) {
      final userImage = context.read<UserProvider>().imageUrl;
      if (userImage != null && userImage.isNotEmpty) {
        return userImage;
      }
    }

    return "https://st2.depositphotos.com/2001755/5408/i/450/depositphotos_54081723-stock-photo-beautiful-nature-landscape.jpg";
  }

  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  Future<void> _updatePalette() async {
    final imageUrl = getProfileImage(context);

    final palette = await PaletteGenerator.fromImageProvider(
      NetworkImage(imageUrl),
    );

    if (!mounted) return;

    setState(() {
      borderColor = palette.dominantColor?.color ?? Colors.grey;
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = getProfileImage(context);

    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [borderColor.withOpacity(0.5), borderColor],
                ),
              ),
              padding: const EdgeInsets.all(3),
              child: CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.story.name,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
