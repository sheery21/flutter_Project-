import 'package:flutter/material.dart';
import 'package:flutter_11_start/screens/massage.dart';
import 'package:flutter_11_start/widgets/uihelper.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLiked = false;

  final arrContent = [
    {
      'img':
          'https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=612x612&w=0&k=20&c=l15OdMWjgCKycMMShP8UK94ELVlEGvt7GmB_esHWPYE=',
      "name": "Your Story",
    },
    {
      'img':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ_2oII-AssPFNOvcLQ6ecJ6ZWQlUbKU3j8w&s',
      'name': 'karennne',
    },
    {
      'img':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm2-IiCQnnEHH1dk5HN2K60xrv8Wyu8VRW7Q&s',
      'name': 'zackjohn30',
    },
    {
      'img':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ1ipeQbFseUM_GzxwMoQj45w9HtAnu4eu5w&s',
      'name': 'kieron_don',
    },
    {
      'img':
          'https://burst.shopifycdn.com/photos/a-bubbling-cloud-of-rich-pink-and-yellow.jpg?width=373&format=pjpg&exif=0&iptc=0',
      'name': 'craig__820',
    },
    {
      'img':
          'https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=612x612&w=0&k=20&c=l15OdMWjgCKycMMShP8UK94ELVlEGvt7GmB_esHWPYE=',
      "name": "Your Story",
    },
    {
      'img':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ_2oII-AssPFNOvcLQ6ecJ6ZWQlUbKU3j8w&s',
      'name': 'karennne',
    },
    {
      'img':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm2-IiCQnnEHH1dk5HN2K60xrv8Wyu8VRW7Q&s',
      'name': 'zackjohn',
    },
    {
      'img':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ1ipeQbFseUM_GzxwMoQj45w9HtAnu4eu5w&s',
      'name': 'kieron_d',
    },
    {
      'img':
          'https://burst.shopifycdn.com/photos/a-bubbling-cloud-of-rich-pink-and-yellow.jpg?width=373&format=pjpg&exif=0&iptc=0',
      'name': 'craig_',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF121212),
        toolbarHeight: 75,
        leading: UiHelper.CustomImage(imgUrl: 'camra_icon.png'),
        title: UiHelper.CustomImage(imgUrl: 'insta_Logo.png'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: UiHelper.CustomImage(imgUrl: 'IGTV.png'),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => massage()));
            },
            icon: UiHelper.CustomImage(imgUrl: 'Messanger.png'),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: arrContent.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(
                                arrContent[index]['img'].toString(),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              arrContent[index]['name'].toString(),
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 54,
                width: MediaQuery.of(context).size.width,
                child: ListTile(
                  leading: UiHelper.CustomImage(imgUrl: 'Oval01.png'),
                  title: Row(
                    children: [
                      Text(
                        'joshua_l',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 5),
                      UiHelper.CustomImage(imgUrl: 'blueStar.png'),
                    ],
                  ),
                  subtitle: Text(
                    'Tokyo, Japan',
                    style: TextStyle(color: Color(0XFFF9F9F9), fontSize: 12),
                  ),
                  trailing: UiHelper.CustomImage(imgUrl: 'MoreIcon.png'),
                ),
              ),
              SizedBox(height: 15.0),
              UiHelper.customImage(
                imgUrl: 'Rectangle.png',
                height: 400,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(height: 8.0),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isLiked = !isLiked;
                              });
                            },
                            icon: Icon(
                              isLiked
                                  ? CupertinoIcons.heart_fill
                                  : CupertinoIcons.heart,
                              color: isLiked ? Colors.red : Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: UiHelper.CustomImage(imgUrl: 'commit.png'),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: UiHelper.CustomImage(imgUrl: 'Messanger.png'),
                          ),
                        ],
                      ),
                      Container(
                        width: 30,
                        child: UiHelper.CustomImage(imgUrl: 'save.png'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          UiHelper.customImage(imgUrl: 'model.png'),
                          SizedBox(width: 5),
                          Text(
                            'Liked by ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'sujal_dave ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'and ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '44,686 others',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'sujal_dave ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                                  Text(
                                    'The game in Japan was amazing and I want ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                            ],
                          ),
                              Text(
                                'to share some photos',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
    );
  }
}
