
import 'package:flitter_9_start/pages/home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flitter_9_start/pages/order.dart';
import 'package:flitter_9_start/pages/profile.dart';
import 'package:flitter_9_start/pages/wallet.dart';
import 'package:flutter/material.dart';

class ButtomNav extends StatefulWidget {
  const ButtomNav({super.key});

  @override
  State<ButtomNav> createState() => _ButtomNavState();
}

class _ButtomNavState extends State<ButtomNav> {
  late List<Widget> pages;

  late Order order;
  late Wallet wallet;
  late ProfilePage profilePage;
  late Home home;

  int currentTabIndex = 0;

  @override
  void initState() {
    home = Home();
    order = Order();
    profilePage =ProfilePage();
    order =Order();
    wallet = Wallet();

    pages =[home, order, wallet, profilePage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60.0,
        color: Colors.black,
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        onTap:(index){
          setState(() {
            currentTabIndex = index;
          });
        },
        items:[
          Icon(Icons.home,color: Colors.white,size: 30.0,),
          Icon(Icons.shopping_bag,color: Colors.white,size: 30.0,),
          Icon(Icons.wallet,color: Colors.white,size: 30.0,),
          Icon(Icons.person,color: Colors.white,size: 30.0,),
        ]),
      body: pages[currentTabIndex],
    );
  }
}
