import 'package:flutter/material.dart';
import 'package:flutter_12_start/screens/BottomNav/bottomNav.dart';
import 'package:flutter_12_start/widgets/uihelpar.dart';

class Crisppychiken extends StatefulWidget {
  const Crisppychiken({super.key});

  @override
  State<Crisppychiken> createState() => _CrisppychikenState();
}

class _CrisppychikenState extends State<Crisppychiken> {
  int quantity = 1;
  double unitPrice = 8.99;

  @override
  Widget build(BuildContext context) {
    double totalPrice = quantity * unitPrice;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            UiHelper.CustomImage(imagePath: 'Coin_icon.png'),
            Text(
              '25 Coins',
              style: TextStyle(
                color: Color(0xFF100235),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,

        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: [
              UiHelper.CustomRadiusImage(
                imagePath: 'Crispy Chicken0.2.png',
                width: 350,
                height: 196,
                topLeft: 10,
                topRight: 10,
                bottomLeft: 10,
                bottomRight: 10,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Crispy Chicken',
                    style: UiHelper.boldBlackTextFeildStyle(),
                  ),
                  Text(
                    '\$${totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Color(0xFF366190),
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Color(0xFFFCD151), size: 18),
                      Icon(Icons.star, color: Color(0xFFFCD151), size: 18),
                      Icon(Icons.star, color: Color(0xFFFCD151), size: 18),
                      Icon(Icons.star, color: Color(0xFFFCD151), size: 18),
                      Icon(Icons.star, color: Color(0xFF9CA3AF), size: 18),
                      SizedBox(width: 5),
                      Text(
                        '4.7 (256 revlews)',
                        style: TextStyle(
                          color: Color(0xFF848282),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 38,
                        height: 24,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF366190), Color(0xFF2D7ED7)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7.0),
                            bottomLeft: Radius.circular(7.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) {
                                quantity--;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 20,
                          ),
                          padding: EdgeInsets.all(0),
                        ),
                      ),
                      Container(
                        width: 38,
                        height: 24,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            quantity.toString().padLeft(2, '0'),
                            style: UiHelper.ShortTextFeildStyle(),
                          ),
                        ),
                      ),
                      Container(
                        width: 38,
                        height: 24,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF366190), Color(0xFF2D7ED7)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(7.0),
                            bottomRight: Radius.circular(7.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: Icon(Icons.add, color: Colors.white, size: 20),
                          padding: EdgeInsets.all(0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "The burger was juicy and packed with flavor, just like I ordered! App's customization options made it super easy to personalize. Delivery was quick, and everything was fresh—highly recommend!",
                style: UiHelper.ShortTextFeildStyle(),
              ),
              SizedBox(height: 25),
              Column(
                children: [
                  Divider(color: Color(0xFFDDDDDD), thickness: 1),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.access_time_filled_outlined,
                              color: Color(0xFF5B5959),
                              size: 25,
                            ),
                            SizedBox(width: 10),
                            Text(
                              '25-30 min',
                              style: UiHelper.blueLinkTextFeildStyle(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.local_fire_department,
                              color: Color(0xFF5B5959),
                              size: 25,
                            ),
                            SizedBox(width: 10),
                            Text(
                              '420 kcal',
                              style: UiHelper.blueLinkTextFeildStyle(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.people_rounded,
                              color: Color(0xFF5B5959),
                              size: 25,
                            ),
                            SizedBox(width: 10),
                            Text(
                              '1 serving',
                              style: UiHelper.blueLinkTextFeildStyle(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(color: Color(0xFFDDDDDD), thickness: 1),
                ],
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 56,
                        width: 163,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFFE5E7EB)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Calories',
                                style: UiHelper.ShortTextFeildStyle(),
                              ),
                              Text(
                                '420 Kcall',
                                style: UiHelper.blueLinkTextFeildStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 56,
                        width: 163,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFFE5E7EB)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Protein',
                                style: UiHelper.ShortTextFeildStyle(),
                              ),
                              Text(
                                '32g',
                                style: UiHelper.blueLinkTextFeildStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 56,
                        width: 163,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFFE5E7EB)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Carbs',
                                style: UiHelper.ShortTextFeildStyle(),
                              ),
                              Text(
                                '28g',
                                style: UiHelper.blueLinkTextFeildStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 56,
                        width: 163,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFFE5E7EB)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fat',
                                style: UiHelper.ShortTextFeildStyle(),
                              ),
                              Text(
                                '18g',
                                style: UiHelper.blueLinkTextFeildStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  UiHelper.CustomButton(
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Bottomnav(startIndex: 3),
                        ),
                      );
                    },
                    buttonName: "Add to cart",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
