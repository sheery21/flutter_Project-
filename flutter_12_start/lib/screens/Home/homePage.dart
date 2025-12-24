import 'package:flutter/material.dart';
import 'package:flutter_12_start/Crispy%20Chicken/CrisppyChiken.dart';
import 'package:flutter_12_start/Model/category_model.dart';
import 'package:flutter_12_start/screens/Burgers/BrugersPage.dart';
import 'package:flutter_12_start/screens/NearbyOutlets/nearbyOutlets.dart';
import 'package:flutter_12_start/screens/SideNav/sideNav.dart';
import 'package:flutter_12_start/service/CategoryModel/CategoryModelpage.dart';
import 'package:flutter_12_start/widgets/uihelpar.dart';
import '../Menu/menu.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController searchController = TextEditingController();
  @override
  List<CategoryModel> categories = [];
  double _rotationAngle = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Drawer(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 10,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Positioned.fill(top: 0, child: Sidenav()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      body: Container(
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
                      icon: Icon(Icons.menu, color: Colors.white, size: 35),
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
                                          (context, animation1, animation2) =>
                                              Nearbyoutlets(),
                                      transitionDuration: Duration.zero,
                                      reverseTransitionDuration: Duration.zero,
                                    ),
                                  );
                                });
                              },
                              icon: AnimatedRotation(
                                turns: _rotationAngle / 360,
                                duration: Duration(seconds: 1),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                ),
                              ),
                              padding: EdgeInsets.all(0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.notifications, color: Colors.white, size: 35),
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
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'First order? ',
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      fontFamily: 'Rancho',
                                    ),
                                  ),
                                  Text(
                                    '50%',
                                    style: TextStyle(
                                      color: Color(0xFFFCD151),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      fontFamily: 'Rancho',
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'off & free delivery',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  fontFamily: 'Rancho',
                                ),
                              ),
                              Text(
                                'For Food',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  fontFamily: 'Rancho',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        UiHelper.CustomImage(
                          imagePath: 'girl_img.png',
                          height: 165,
                        ),
                      ],
                    ),
                    SizedBox(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF6F9FF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.zero,
                              height: 180,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    SizedBox(width: 20),
                                    ListView.builder(
                                      itemCount: categories.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return CategoryTile(
                                          image: categories[index].image!,
                                          name: categories[index].name!,
                                        );
                                      },
                                    ),
                                    SizedBox(width: 20),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 20.0,
                                  right: 15.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Offers for you',
                                      style: UiHelper.boldBlueTextFeildStyle(),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => OderMenu(
                                                  categories: categories,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Go to menu',
                                            style:
                                                UiHelper.blueLinkTextFeildStyle(),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Icon(
                                          Icons.arrow_forward_rounded,
                                          color: Color(0xFF3078BE),
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Crisppychiken(),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            10.0,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                0.2,
                                              ),
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    child: UiHelper.CustomImage(
                                                      imagePath:
                                                          'Crispy Chicken.png',
                                                      width: 190,
                                                      height: 120,
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 80,
                                                    right: 10,
                                                    child: Container(
                                                      width: 22,
                                                      height: 32,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10.0,
                                                            ),
                                                      ),
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Color(
                                                          0xFF3078BE,
                                                        ),
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8.0,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 10),
                                                  Text(
                                                    'Crispy Chicken',
                                                    style:
                                                        UiHelper.boldDailyDealsTextFeildStyle(),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    'Lettuce, tomatoes and...',
                                                    style:
                                                        UiHelper.ShortTextFeildStyle(),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    "\$8.99",
                                                    style:
                                                        UiHelper.boldDailyDealsTextFeildStyle(),
                                                  ),
                                                  SizedBox(height: 10),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Stack(
                                            children: [
                                              Container(
                                                child:
                                                    UiHelper.CustomRadiusImage(
                                                      imagePath:
                                                          'Chees_frise.png',
                                                      topLeft: 10,
                                                      topRight: 10,
                                                      width: 190,
                                                      height: 120,
                                                    ),
                                              ),
                                              Positioned(
                                                top: 80,
                                                right: 10,
                                                child: Container(
                                                  width: 22,
                                                  height: 32,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10.0,
                                                        ),
                                                  ),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Color(0xFF3078BE),
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8.0,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 10),
                                              Text(
                                                'Crispy Chicken',
                                                style:
                                                    UiHelper.boldDailyDealsTextFeildStyle(),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                'Lettuce, tomatoes and...',
                                                style:
                                                    UiHelper.ShortTextFeildStyle(),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                "\$8.99",
                                                style:
                                                    UiHelper.boldDailyDealsTextFeildStyle(),
                                              ),
                                              SizedBox(height: 10),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Stack(
                                            children: [
                                              Container(
                                                child:
                                                    UiHelper.CustomRadiusImage(
                                                      imagePath:
                                                          'Choco_Shake.png',
                                                      topLeft: 10,
                                                      topRight: 10,
                                                      width: 190,
                                                      height: 120,
                                                    ),
                                              ),
                                              Positioned(
                                                top: 80,
                                                right: 10,
                                                child: Container(
                                                  width: 22,
                                                  height: 32,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10.0,
                                                        ),
                                                  ),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Color(0xFF3078BE),
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8.0,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 10),
                                              Text(
                                                'Crispy Chicken',
                                                style:
                                                    UiHelper.boldDailyDealsTextFeildStyle(),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                'Lettuce, tomatoes and...',
                                                style:
                                                    UiHelper.ShortTextFeildStyle(),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                "\$8.99",
                                                style:
                                                    UiHelper.boldDailyDealsTextFeildStyle(),
                                              ),
                                              SizedBox(height: 10),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Daily Deals',
                                    style: UiHelper.boldBlackTextFeildStyle(),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'See all',
                                        style:
                                            UiHelper.blueLinkTextFeildStyle(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  SizedBox(width: 20),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.2,
                                            ),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: UiHelper.CustomRadiusImage(
                                              imagePath:
                                                  'Double Cheese Combo.png',
                                              width: 273,
                                              height: 120,
                                              topLeft: 10,
                                              topRight: 10,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 10),
                                                Container(
                                                  width: 255,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Double Cheese Combo',
                                                        style:
                                                            UiHelper.boldDailyDealsTextFeildStyle(),
                                                      ),
                                                      SizedBox(width: 10),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color: Color(
                                                              0xFFFCD151,
                                                            ),
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            '4.8',
                                                            style:
                                                                UiHelper.boldDailyDealsTextFeildStyle(),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  'Lettuce, tomatoes and...',
                                                  style:
                                                      UiHelper.ShortTextFeildStyle(),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  "\$8.99",
                                                  style:
                                                      UiHelper.boldDailyDealsTextFeildStyle(),
                                                ),
                                                SizedBox(height: 10),
                                                Container(
                                                  width: 255,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '\$12.99',
                                                        style:
                                                            UiHelper.boldBlueTextFeildStyle(),
                                                      ),
                                                      SizedBox(width: 10),
                                                      Container(
                                                        width: 33,
                                                        height: 33,
                                                        decoration:
                                                            BoxDecoration(
                                                              color: Color(
                                                                0xFF3078BE,
                                                              ),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                          size: 17,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: UiHelper.CustomRadiusImage(
                                            imagePath: 'Chicken Nuggets.jpg',
                                            width: 273,
                                            height: 120,
                                            topLeft: 10,
                                            topRight: 10,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8.0,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 10),
                                              Container(
                                                width: 255,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Double Cheese Combo',
                                                      style:
                                                          UiHelper.boldDailyDealsTextFeildStyle(),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Icon(
                                                          Icons.star,
                                                          color: Color(
                                                            0xFFFCD151,
                                                          ),
                                                          size: 15,
                                                        ),
                                                        Text(
                                                          '4.8',
                                                          style:
                                                              UiHelper.boldDailyDealsTextFeildStyle(),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                'Lettuce, tomatoes and...',
                                                style:
                                                    UiHelper.ShortTextFeildStyle(),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                "\$8.99",
                                                style:
                                                    UiHelper.boldDailyDealsTextFeildStyle(),
                                              ),
                                              SizedBox(height: 10),
                                              Container(
                                                width: 255,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '\$12.99',
                                                      style:
                                                          UiHelper.boldBlueTextFeildStyle(),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Container(
                                                      width: 33,
                                                      height: 33,
                                                      decoration: BoxDecoration(
                                                        color: Color(
                                                          0xFF3078BE,
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                        size: 17,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Limited Time Offers',
                                    style: UiHelper.boldBlackTextFeildStyle(),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'See all',
                                        style:
                                            UiHelper.blueLinkTextFeildStyle(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  SizedBox(width: 20),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.2,
                                            ),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: UiHelper.CustomRadiusImage(
                                              imagePath: 'Classic Supreme.png',
                                              width: 273,
                                              height: 120,
                                              topLeft: 10,
                                              topRight: 10,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 10),
                                                Container(
                                                  width: 255,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Double Cheese Combo',
                                                        style:
                                                            UiHelper.boldDailyDealsTextFeildStyle(),
                                                      ),
                                                      SizedBox(width: 10),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color: Color(
                                                              0xFFFCD151,
                                                            ),
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            '4.8',
                                                            style:
                                                                UiHelper.boldDailyDealsTextFeildStyle(),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  'Lettuce, tomatoes and...',
                                                  style:
                                                      UiHelper.ShortTextFeildStyle(),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  "\$8.99",
                                                  style:
                                                      UiHelper.boldDailyDealsTextFeildStyle(),
                                                ),
                                                SizedBox(height: 10),
                                                Container(
                                                  width: 255,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '\$12.99',
                                                        style:
                                                            UiHelper.boldBlueTextFeildStyle(),
                                                      ),
                                                      SizedBox(width: 10),
                                                      Container(
                                                        width: 33,
                                                        height: 33,
                                                        decoration:
                                                            BoxDecoration(
                                                              color: Color(
                                                                0xFF3078BE,
                                                              ),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                          size: 17,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: UiHelper.CustomRadiusImage(
                                            imagePath: 'Chicken Nuggets.jpg',
                                            width: 273,
                                            height: 120,
                                            topLeft: 10,
                                            topRight: 10,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8.0,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 10),
                                              Container(
                                                width: 255,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Double Cheese Combo',
                                                      style:
                                                          UiHelper.boldDailyDealsTextFeildStyle(),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Icon(
                                                          Icons.star,
                                                          color: Color(
                                                            0xFFFCD151,
                                                          ),
                                                          size: 15,
                                                        ),
                                                        Text(
                                                          '4.8',
                                                          style:
                                                              UiHelper.boldDailyDealsTextFeildStyle(),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                'Lettuce, tomatoes and...',
                                                style:
                                                    UiHelper.ShortTextFeildStyle(),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                "\$8.99",
                                                style:
                                                    UiHelper.boldDailyDealsTextFeildStyle(),
                                              ),
                                              SizedBox(height: 10),
                                              Container(
                                                width: 255,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '\$12.99',
                                                      style:
                                                          UiHelper.boldBlueTextFeildStyle(),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Container(
                                                      width: 33,
                                                      height: 33,
                                                      decoration: BoxDecoration(
                                                        color: Color(
                                                          0xFF3078BE,
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                        size: 17,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatefulWidget {
  String name, image;
  CategoryTile({required this.name, required this.image});

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CatgorTile(categoryName: widget.name),
          ),
        );
      },
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 122,
                  height: 122,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFE2E4EA),
                        spreadRadius: 0,
                        blurRadius: 1,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(widget.image, width: 20, height: 20),
                ),
              ),
              SizedBox(height: 10),
              Text(widget.name, style: UiHelper.boldBlackTextFeildStyle()),
            ],
          ),
        ],
      ),
    );
  }
}
