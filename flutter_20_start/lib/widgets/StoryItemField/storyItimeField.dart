import 'package:flutter/material.dart';
import 'package:flutter_20_start/models/story_models.dart';
import 'package:palette_generator/palette_generator.dart';

class Storyitimefield extends StatefulWidget {
  final StoryModel story;
  final VoidCallback onTap;

  const Storyitimefield({super.key, required this.story, required this.onTap});

  @override
  State<Storyitimefield> createState() => _StoryitimefieldState();
}

class _StoryitimefieldState extends State<Storyitimefield> {
  Color borderColor =Colors.grey;

   
   @override
  void initState() {
    super.initState();
    _updatePalette();
  }

Future<void> _updatePalette() async {
  final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(NetworkImage(widget.story.image));
  setState(() {
    borderColor = paletteGenerator.dominantColor?.color ?? Colors.grey;
  }); 
}


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [borderColor.withOpacity(0.5), borderColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(3.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  padding: EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage(widget.story.image),
                  ),
                ),
              ),
            ),
            SizedBox(height: 6),
            Text(widget.story.name, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
