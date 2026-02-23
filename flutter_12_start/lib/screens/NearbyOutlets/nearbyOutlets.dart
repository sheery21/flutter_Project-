import 'package:flutter/material.dart';
import 'package:flutter_12_start/screens/BottomNav/bottomNav.dart';

import '../../widgets/uihelpar.dart';
import '../SideNav/sideNav.dart';

class Nearbyoutlets extends StatefulWidget {
  const Nearbyoutlets({super.key});

  @override
  State<Nearbyoutlets> createState() => _NearbyoutletsState();
}

class _NearbyoutletsState extends State<Nearbyoutlets> {
  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double _rotationAngle = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,

      /// Drawer Section
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Drawer(
          child: Stack(
            children: [
              const Positioned.fill(child: Sidenav()),
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF3078BE),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Welcome, Alex',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 13,
                                ),
                                Text(
                                  '123 Main St, New York',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _rotationAngle += 185;
                                    });

                                    Future.delayed(Duration(seconds: 1), () {
                                      Navigator.pushReplacement(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder:
                                              (
                                                context,
                                                animation1,
                                                animation2,
                                              ) => Bottomnav(startIndex: 0),
                                          transitionDuration: Duration.zero,
                                          reverseTransitionDuration:
                                              Duration.zero,
                                        ),
                                      );
                                    });
                                  },
                                  icon: AnimatedRotation(
                                    turns: _rotationAngle / -360,
                                    duration: Duration(seconds: 1),
                                    child: Icon(
                                      Icons.keyboard_arrow_up,
                                      color: Colors.white,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(0),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 20.0),
                  child: Center(
                    child: UiHelper.CustomWhiteTextField(
                      controller: searchController,
                      text: 'Search for foods...',
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Color(0xFF898989)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Nearby Outlets',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 190,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            right: 8.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 75,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE1E7ED),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '⭐ 4.5',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF3078BE),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Boardwalk burgers',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'Multi-cuisine',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF3078BE),
                                    ),
                                  ),
                                  SizedBox(width: 30),
                                  Text(
                                    '0.4 Km away',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF385E8E),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '32650 South Fraser Way Unit P700,',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF5B5959),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Abbotsford, British Columbia V2T 4W2,',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF5B5959),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Canada',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF5B5959),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      UiHelper.CustomImage(
                                        imagePath: 'Boardwalk_logos.png',
                                        height: 40,
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFB9DDFF),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.send_sharp,
                                                color: Color(0xFF3078BE),
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFB9DDFF),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.shop,
                                                color: Color(0xFF3078BE),
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 190,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            right: 8.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 75,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE1E7ED),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '⭐ 4.5',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF3078BE),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Boardwalk burgers',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'Multi-cuisine',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF3078BE),
                                    ),
                                  ),
                                  SizedBox(width: 30),
                                  Text(
                                    '0.4 Km away',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF385E8E),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '32650 South Fraser Way Unit P700,',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF5B5959),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Abbotsford, British Columbia V2T 4W2,',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF5B5959),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Canada',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF5B5959),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      UiHelper.CustomImage(
                                        imagePath: 'Boardwalk_logos.png',
                                        height: 40,
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFB9DDFF),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.send_sharp,
                                                color: Color(0xFF3078BE),
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFB9DDFF),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.shop,
                                                color: Color(0xFF3078BE),
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 190,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            right: 8.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 75,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE1E7ED),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '⭐ 4.5',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF3078BE),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Boardwalk burgers',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'Multi-cuisine',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF3078BE),
                                    ),
                                  ),
                                  SizedBox(width: 30),
                                  Text(
                                    '0.4 Km away',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF385E8E),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '32650 South Fraser Way Unit P700,',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF5B5959),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Abbotsford, British Columbia V2T 4W2,',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF5B5959),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Canada',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF5B5959),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      UiHelper.CustomImage(
                                        imagePath: 'Boardwalk_logos.png',
                                        height: 40,
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFB9DDFF),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.send_sharp,
                                                color: Color(0xFF3078BE),
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFB9DDFF),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.shop,
                                                color: Color(0xFF3078BE),
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 190,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            right: 8.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 75,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE1E7ED),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '⭐ 4.5',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF3078BE),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Boardwalk burgers',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'Multi-cuisine',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF3078BE),
                                    ),
                                  ),
                                  SizedBox(width: 30),
                                  Text(
                                    '0.4 Km away',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF385E8E),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '32650 South Fraser Way Unit P700,',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF5B5959),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Abbotsford, British Columbia V2T 4W2,',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF5B5959),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Canada',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF5B5959),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      UiHelper.CustomImage(
                                        imagePath: 'Boardwalk_logos.png',
                                        height: 40,
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFB9DDFF),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.send_sharp,
                                                color: Color(0xFF3078BE),
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFB9DDFF),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.shop,
                                                color: Color(0xFF3078BE),
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 190,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            right: 8.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 75,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE1E7ED),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '⭐ 4.5',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF3078BE),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Boardwalk burgers',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'Multi-cuisine',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF3078BE),
                                    ),
                                  ),
                                  SizedBox(width: 30),
                                  Text(
                                    '0.4 Km away',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF385E8E),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '32650 South Fraser Way Unit P700,',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF5B5959),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Abbotsford, British Columbia V2T 4W2,',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF5B5959),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Canada',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF5B5959),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      UiHelper.CustomImage(
                                        imagePath: 'Boardwalk_logos.png',
                                        height: 40,
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFB9DDFF),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.send_sharp,
                                                color: Color(0xFF3078BE),
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFB9DDFF),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.shop,
                                                color: Color(0xFF3078BE),
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
