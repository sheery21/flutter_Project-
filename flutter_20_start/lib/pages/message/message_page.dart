import 'package:flutter/material.dart';
import 'package:flutter_20_start/pages/profile/profile_page.dart';
import 'package:flutter_20_start/pages/search/search_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:story_view/story_view.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  // ✅ Dummy stories data
  final List<Map<String, String>> stories = [
    {"name": "Ali", "image": "https://picsum.photos/200/300?1"},
    {"name": "Ahmed", "image": "https://picsum.photos/200/300?2"},
    {"name": "Sara", "image": "https://picsum.photos/200/300?3"},
    {"name": "Ayesha", "image": "https://picsum.photos/200/300?4"},
  ];

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
          /// 🔥 Instagram-like Stories
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (context, index) {
                final story = stories[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => StoryScreen(story: story),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        /// Gradient Ring
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Colors.purple, Colors.orange],
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 32,
                            backgroundImage: NetworkImage(story['image']!),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          story['name']!,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          const Divider(),

          const Center(
            child: Text("Message Page", style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}

class StoryScreen extends StatefulWidget {
  final Map<String, String> story;
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
          StoryItem.pageImage(
            url: widget.story['image']!,
            controller: _controller,
          ),
        ],
        onComplete: () => Navigator.pop(context),
      ),
    );
  }
}
