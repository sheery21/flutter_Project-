import 'package:flutter/material.dart';
import 'package:flutter_12_start/screens/BottomNav/bottomNav.dart';
import 'package:flutter_12_start/screens/Home/homePage.dart';

import '../../widgets/uihelpar.dart';

class YourorderPage extends StatefulWidget {
  const YourorderPage({super.key});

  @override
  State<YourorderPage> createState() => _YourorderState();
}

class _YourorderState extends State<YourorderPage> {
  int quantity = 1;
  double unitPrice = 8.99;

  @override
  Widget build(BuildContext context) {
    double totalPrice = quantity * unitPrice;
    TextEditingController TextController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Order',
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color(0xFFF9FAFB)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 345,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFF5B595980)),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: UiHelper.CustomRadiusImage(
                          imagePath: 'Crispy Chicken.png',
                          width: 95.74,
                          height: 150.06,
                          topLeft: 10,
                          topRight: 10,
                          bottomLeft: 10,
                          bottomRight: 10,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 220,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Crispy Chicken',
                                  style: UiHelper.blackTextFeildStyle(),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xFFFCD151),
                                      size: 18,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '4.7',
                                      style: UiHelper.blackTextFeildStyle(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 5),
                          Text(
                            'Lettuce, tomatoes and secret sauce',
                            style: UiHelper.ShortTextFeildStyle(),
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: 220,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 38,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF366190),
                                            Color(0xFF2D7ED7),
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(7.0),
                                          bottomLeft: Radius.circular(7.0),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.2,
                                            ), // shadow ka color aur opacity
                                            spreadRadius:
                                                1, // shadow kitna spread hoga
                                            blurRadius:
                                                2, // shadow kitna soft hoga
                                            offset: Offset(
                                              0,
                                              1,
                                            ), // x, y direction mai shadow
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
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        // borderRadius: BorderRadius.only( topLeft: Radius.circular(7.0), bottomLeft: Radius.circular(7.0),),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.2,
                                            ), // shadow ka color aur opacity
                                            spreadRadius:
                                                1, // shadow kitna spread hoga
                                            blurRadius:
                                                2, // shadow kitna soft hoga
                                            offset: Offset(
                                              0,
                                              1,
                                            ), // x, y direction mai shadow
                                          ),
                                        ],
                                      ),
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
                                          colors: [
                                            Color(0xFF366190),
                                            Color(0xFF2D7ED7),
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(7.0),
                                          bottomRight: Radius.circular(7.0),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.2,
                                            ), // shadow ka color aur opacity
                                            spreadRadius:
                                                1, // shadow kitna spread hoga
                                            blurRadius:
                                                2, // shadow kitna soft hoga
                                            offset: Offset(
                                              0,
                                              1,
                                            ), // x, y direction mai shadow
                                          ),
                                        ],
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            quantity++;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        padding: EdgeInsets.all(0),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '\$${totalPrice.toStringAsFixed(2)}',
                                  style: UiHelper.blueTextFeildStyle(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: UiHelper.ShortTextFeildStyle(),
                          ),
                          Text(
                            '\$${totalPrice.toStringAsFixed(2)}',
                            style: UiHelper.ShortTextFeildStyle(),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery',
                            style: UiHelper.ShortTextFeildStyle(),
                          ),
                          Text('\$4.99', style: UiHelper.ShortTextFeildStyle()),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tex', style: UiHelper.ShortTextFeildStyle()),
                          Text('\$3.99', style: UiHelper.ShortTextFeildStyle()),
                        ],
                      ),
                      Divider(color: Color(0xFFDDDDDD), thickness: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total', style: UiHelper.blackTextFeildStyle()),
                          Text(
                            '\$${totalPrice.toStringAsFixed(2)}',
                            style: UiHelper.blackTextFeildStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 256,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xFF366190),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                            0.2,
                          ), // shadow ka color aur opacity
                          spreadRadius: 1, // shadow kitna spread hoga
                          blurRadius: 2, // shadow kitna soft hoga
                          offset: Offset(0, 1), // x, y direction mai shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Earning',
                            style: UiHelper.witeTextFeildStyle(),
                          ),
                          Row(
                            children: [
                              UiHelper.CustomImage(imagePath: 'Coin_icon.png'),
                              Text(
                                '25 Coins',
                                style: UiHelper.boldWiteTextFeildStyle(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Payment method',
                    style: UiHelper.boldBlackTextFeildStyle(),
                  ),
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'All transactions are secure and encrypted.',
                    style: UiHelper.ShortTextFeildStyle(),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 111.67,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xFFE5E7EB)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: UiHelper.CustomRadiusImage(
                                imagePath: 'master_card.png',
                                width: 111.67,
                                height: 60.06,
                                topLeft: 10,
                                topRight: 10,
                                bottomLeft: 10,
                                bottomRight: 10,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: -10,
                            right: -10,
                            child: UiHelper.CustomImage(imagePath: 'Icon.png'),
                          ),
                        ],
                      ),
                      Container(
                        width: 111.67,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFFE5E7EB)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: UiHelper.CustomRadiusImage(
                            imagePath: 'Paypal.png',
                            width: 111.67,
                            height: 60.06,
                            topLeft: 10,
                            topRight: 10,
                            bottomLeft: 10,
                            bottomRight: 10,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 111.67,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFFE5E7EB)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: UiHelper.CustomRadiusImage(
                            imagePath: 'Applypay.png',
                            width: 111.67,
                            height: 60.06,
                            topLeft: 10,
                            topRight: 10,
                            bottomLeft: 10,
                            bottomRight: 10,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Address',
                        style: UiHelper.boldBlackTextFeildStyle(),
                      ),
                      SizedBox(width: 10),
                      Text('Change', style: UiHelper.blueLinkTextFeildStyle()),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        UiHelper.CustomImage(imagePath: 'house_map.png'),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'My home',
                                style: UiHelper.boldBlackTextFeildStyle(),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Alex Johnson,',
                                    style: UiHelper.ShortTextFeildStyle(),
                                  ),
                                  Text(
                                    '123 Main Street, Apt 48, New York',
                                    style: UiHelper.ShortTextFeildStyle(),
                                  ),
                                  Text(
                                    'United States : +1 (555) 123-4567',
                                    style: UiHelper.ShortTextFeildStyle(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    children: [
                      UiHelper.CustomImage(imagePath: 'BillingAddres.png'),
                      SizedBox(width: 10),
                      Text('Billing address same as shipping'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 244,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xFFE5E7EB)),
                            ),
                            child: TextField(
                              controller: TextController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Discount code',
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                contentPadding: EdgeInsets.only(left: 10),
                              ),
                            ),
                          ),
                          Container(
                            width: 78,
                            height: 48,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF366190),
                                  Color(0xFF2D7ED7),
                                ], // do shade
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Apply',
                                style: UiHelper.witeTextFeildStyle(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                UiHelper.CustomButton(
                  callback: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Bottomnav(startIndex: 0),
                      ),
                    );
                  },
                  buttonName: 'pay \$${totalPrice.toStringAsFixed(2)}',
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
