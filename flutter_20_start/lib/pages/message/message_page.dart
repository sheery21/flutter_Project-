import 'package:flutter/material.dart';
import 'package:flutter_20_start/data/story_data.dart';
import 'package:flutter_20_start/models/story_models.dart';
import 'package:flutter_20_start/pages/profile/profile_page.dart';
import 'package:flutter_20_start/pages/search/search_page.dart';
import 'package:flutter_20_start/widgets/AddStoryField/addStoryField.dart';
import 'package:flutter_20_start/widgets/StoryItemField/storyItimeField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:story_view/story_view.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.search, size: 32),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SearchPage()),
                  );
                },
              ),
              const Text(
                "Home",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.circleUser, size: 30),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ProfilePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: StoryData.stories.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Addstoryfield(
                    imageUrl:
                        "https://st2.depositphotos.com/2001755/5408/i/450/depositphotos_54081723-stock-photo-beautiful-nature-landscape.jpg",
                    onTap: () {},
                  );
                }
                StoryModel story = StoryData.stories[index - 1];
                return Storyitimefield(
                  story: story,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => StoryScreen(story: story),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          const Center(
            child: Text("Message Page", style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}

class StoryScreen extends StatefulWidget {
  final StoryModel story;

  const StoryScreen({super.key, required this.story});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final StoryController _controller = StoryController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        controller: _controller,
        storyItems: [
          StoryItem.pageImage(url: widget.story.image, controller: _controller),
        ],
        onComplete: () => Navigator.pop(context),
      ),
    );
  }
}
