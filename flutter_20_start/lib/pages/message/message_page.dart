import 'package:flutter/material.dart';
import 'package:flutter_20_start/data/story_data.dart';
import 'package:flutter_20_start/models/story_models.dart';
import 'package:flutter_20_start/pages/profile/profile_page.dart';
import 'package:flutter_20_start/pages/search/search_page.dart';
import 'package:flutter_20_start/providers/user_Provider.dart';
import 'package:flutter_20_start/widgets/AddStoryField/addStoryField.dart';
import 'package:flutter_20_start/widgets/StoryItemField/storyItimeField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:story_view/story_view.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  StoryModel? myStory;

  @override
  @override
  void initState() {
    super.initState();
    _loadMyStory();
  }

  void _loadMyStory() {
    for (var s in StoryData.stories) {
      if (s.isMyStory) {
        myStory = s;
        break;
      }
    }
  }

  void _addMyStory(String imageUrl) {
    setState(() {
      if (myStory == null) {
        myStory = StoryModel(
          name: "Your Story",
          profileImage:
              context.read<UserProvider>().imageUrl ??
              "https://st2.depositphotos.com/2001755/5408/i/450/depositphotos_54081723-stock-photo-beautiful-nature-landscape.jpg",
          stories: [imageUrl],
          isMyStory: true,
        );
      } else {
        myStory!.stories.add(imageUrl);
      }
    });
  }

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
                icon: Consumer<UserProvider>(
                  builder: (context, userProvider, child) {
                    if (userProvider.imageUrl != null &&
                        userProvider.imageUrl!.isNotEmpty) {
                      return CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(userProvider.imageUrl!),
                      );
                    } else {
                      return const Icon(FontAwesomeIcons.circleUser);
                    }
                  },
                ),
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
                    imageUrl: myStory != null
                        ? myStory!.profileImage
                        : "https://st2.depositphotos.com/2001755/5408/i/450/depositphotos_54081723-stock-photo-beautiful-nature-landscape.jpg",

                    hasStory: myStory != null,

                    onOpenStory: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => StoryScreen(story: myStory!),
                        ),
                      );
                    },

                    onStoryAdded: (imageUrl) {
                      _addMyStory(imageUrl);
                    },
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
    return StoryView(
      controller: _controller,
      storyItems: widget.story.stories
          .map((url) => StoryItem.pageImage(url: url, controller: _controller))
          .toList(),
      onComplete: () => Navigator.pop(context),
    );
  }
}
