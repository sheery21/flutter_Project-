import 'package:flutter/material.dart';
import 'package:flutter_20_start/models/story_models.dart';

class StoryData {
  static List<StoryModel> stories = [
    StoryModel(
      name: "Ali",
      profileImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1AKF7LelsXtbK8YAYYdiPrDMZdFd74ZTgkQ&s",
      stories: ["https://img.freepik.com/free-photo/woman-beach.jpg"],
    ),
    StoryModel(
      name: "Ahmed",
      profileImage:
          "https://img.freepik.com/free-photo/woman-beach-with-her-baby-enjoying-sunset_52683-144131.jpg?size=626&ext=jpg",
      stories: ["https://img.freepik.com/free-photo/happy-little"],
    ),
    StoryModel(
      name: "Sara",
      profileImage:
          "https://media.istockphoto.com/id/1550071750/photo/green-tea-tree-leaves-camellia-sinensis-in-organic-farm-sunlight-fresh-young-tender-bud.jpg?s=612x612&w=0&k=20&c=RC_xD5DY5qPH_hpqeOY1g1pM6bJgGJSssWYjVIvvoLw=",
      stories: ["https://img.freepik.com/free-photo/woman-beach.jpg"],
    ),
    StoryModel(
      name: "Ayesha",
      profileImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdX029ohIUSygq9zirl9fSNBwSLqEOaKEYuw&s",
      stories: ["https://img.freepik.com/free-photo/woman-beach.jpg"],
    ),
  ];

  static void addStory(StoryModel story) {
    stories.add(story);
  }
}
