import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_20_start/data/story_data.dart';
import 'package:flutter_20_start/models/story_models.dart';
import 'package:flutter_20_start/pages/profile/profile_page.dart';
import 'package:flutter_20_start/pages/search/search_page.dart';
import 'package:flutter_20_start/providers/user_Provider.dart';
import 'package:flutter_20_start/widgets/AddStoryField/addStoryField.dart';
import 'package:flutter_20_start/widgets/ColorsField/colorsField.dart';
import 'package:flutter_20_start/widgets/StoryItemField/storyItimeField.dart';
import 'package:flutter_20_start/widgets/customAppBarFIeld/customAppBarField.dart';
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
    final userProvider = context.read<UserProvider>();
    setState(() {
      if (myStory == null) {
        myStory = StoryModel(
          name: "Your Story",
          stories: [imageUrl],
          isMyStory: true,
        );
      } else {
        myStory!.stories.add(imageUrl);
      }
    });
  }

  Widget build(BuildContext context) {
    final userImage = context.watch<UserProvider>().imageUrl;
    return Scaffold(
      backgroundColor: Colorsfield.customBlackColorField(),
      appBar: const Customappbarfield(title: "Home",
       showProfileIcon: true,),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: StoryData.stories.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Addstoryfield(
                    imageUrl: userImage != null && userImage.isNotEmpty
                        ? userImage
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

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  Center(
                    child: Text("Message Page", style: TextStyle(fontSize: 18)),
                  ),
                  
                ],
              ),
            ),
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
