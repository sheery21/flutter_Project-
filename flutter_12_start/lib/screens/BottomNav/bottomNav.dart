import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_12_start/screens/Home/homePage.dart';
import 'package:flutter_12_start/screens/Menu/menu.dart';
import 'package:flutter_12_start/screens/Offers,%20Deals%20&%20Discounts/Offers,%20Deals.dart';
import 'package:flutter_12_start/screens/Profile/Profile.dart';
import 'package:flutter_12_start/screens/Support/support.dart';
import 'package:flutter_12_start/screens/YourOrder/yourOrder.dart';

class Bottomnav extends StatefulWidget {
  final int startIndex;

  const Bottomnav({super.key,  this.startIndex = 0});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {

   late int currentIndex;

   @override
  void initState() {
    super.initState();
    currentIndex = widget.startIndex;
  }

  List<Widget> pages = [Homepage(), OffersPage(), SupportPage(),YourorderPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    bottomNavigationBar : BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Color(0xFF3078BE),
      unselectedItemColor: Colors.grey,
      backgroundColor: Color(0xFFFFFFFF),
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Icon(Icons.home , size: 30,),
        ), label: 'menu'),
        BottomNavigationBarItem(icon: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Icon(Icons.local_offer, size: 30, ),
        ), label: 'Offers'),
        BottomNavigationBarItem(icon: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Icon(Icons.chat_outlined , size: 30,),
        ), label: 'Chat'),
        BottomNavigationBarItem(icon: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Icon(CupertinoIcons.shopping_cart , size: 30,),
        ), label: 'Cart'),
        BottomNavigationBarItem(icon: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child:  Icon(Icons.person , size: 30,),
        ), label: 'Profile'),
      ],
    ),
      body: IndexedStack(children: pages, index: currentIndex),
    );
  }
}
