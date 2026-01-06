import 'package:flutter/material.dart';

class StoryModel {
  final String name;
  final String profileImage;
  final List<String> stories;
  final bool isMyStory;

  StoryModel({
    required this.name,
    this.isMyStory = false,
    required this.profileImage,
    required this.stories,
  });
}
