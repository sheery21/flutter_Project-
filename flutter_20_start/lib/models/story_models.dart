import 'package:flutter/material.dart';

class StoryModel {
  final String name;
  final String image;
  final bool isMyStory;

  StoryModel({required this.name, required this.image, this.isMyStory = false});
}
