import 'package:flutter/material.dart';
import 'package:flutter_20_start/models/story_models.dart';

class StoryData {
  static List<StoryModel> stories = [
    StoryModel(name: "Ali", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1AKF7LelsXtbK8YAYYdiPrDMZdFd74ZTgkQ&s"),
    StoryModel(name: "Ahmed", image: "https://img.freepik.com/free-photo/woman-beach-with-her-baby-enjoying-sunset_52683-144131.jpg?size=626&ext=jpg"),
    StoryModel(name: "Sara", image: "https://media.istockphoto.com/id/1550071750/photo/green-tea-tree-leaves-camellia-sinensis-in-organic-farm-sunlight-fresh-young-tender-bud.jpg?s=612x612&w=0&k=20&c=RC_xD5DY5qPH_hpqeOY1g1pM6bJgGJSssWYjVIvvoLw="),
    StoryModel(name: "Ayesha", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdX029ohIUSygq9zirl9fSNBwSLqEOaKEYuw&s"),
  ];

  static void addStory(StoryModel story) {
    stories.add(story);
  }
}
