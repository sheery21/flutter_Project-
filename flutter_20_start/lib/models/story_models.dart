import 'package:flutter/material.dart';

class StoryModel {
  final String name;
  final List<String> stories;
  final bool isMyStory;

  StoryModel({
    required this.name,
    this.isMyStory = false,
    required this.stories,
  });
}
