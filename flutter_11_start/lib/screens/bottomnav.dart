import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_11_start/screens/home.dart';
import 'package:flutter_11_start/screens/post.dart';
import 'package:flutter_11_start/screens/profile.dart';
import 'package:flutter_11_start/screens/search.dart';
import 'package:flutter_11_start/widgets/uihelper.dart';

import 'heart.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int currentIndex = 0;
  List<Widget> pages = [Home(), Search(), Post(), Heart(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Color(0xFF121212),
        type: BottomNavigationBarType.fixed,
        onTap: ( index){
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Icon(Icons.home , size: 30,),
          ), label: ''),
          BottomNavigationBarItem(icon: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Icon(Icons.search, size: 30, ),
          ), label: ''),
          BottomNavigationBarItem(icon: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Icon(CupertinoIcons.plus_app , size: 30,),
          ), label: ''),
          BottomNavigationBarItem(icon: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Icon(CupertinoIcons.heart , size: 30,),
          ), label: ''),
          BottomNavigationBarItem(icon: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: UiHelper.customImage(imgUrl: 'Oval.png' , height: 35, width: 35,),
          ), label: ''),
        ],
      ),
      body: IndexedStack(children: pages, index: currentIndex),
    );
  }
}
