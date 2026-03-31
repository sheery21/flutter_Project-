import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_12_start/widgets/uihelpar.dart';

class Paymentinfo extends StatefulWidget {
  const Paymentinfo({super.key});

  @override
  State<Paymentinfo> createState() => _PaymentinfoState();
}

class _PaymentinfoState extends State<Paymentinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Info'), centerTitle: true),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFF9FAFB)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Method',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      UiHelper.CustomImage(
                        imagePath: 'SecondaryCard.png',
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    radius: const Radius.circular(10),
                    color: const Color(0xFF6B7280),
                    strokeWidth: 1.5,
                    dashPattern: const [3, 3],
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add, color: Color(0xFF6B7280)),
                          SizedBox(width: 5),
                          Text(
                            'Add New Card',
                            style: TextStyle(color: Color(0xFF6B7280)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      'Payment History',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text('View All', style: UiHelper.blueLinkTextFeildStyle()),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    _PaymentItem(
                      context,
                      image: UiHelper.CustomImage(
                        imagePath: 'payment_icon_1.png',
                      ),
                      title: 'Pizza Palace',
                      price: "-\$24.99",
                      date: 'Today, 2:30 PM',
                      completedOrPending: 'Completed',
                      CardName: '**** 4532 • Visa',
                    ),
                    SizedBox(height: 20),
                    _PaymentItem(
                      context,
                      image: UiHelper.CustomImage(
                        imagePath: 'payment_icon_2.png',
                      ),
                      title: 'Burger King',
                      price: "-\$18.50",
                      date: 'Yesterday, 7:15 PM',
                      completedOrPending: 'Completed',
                      CardName: '**** 8976 • Mastercard',
                    ),
                    SizedBox(height: 20),
                    _PaymentItem(
                      context,
                      image: UiHelper.CustomImage(
                        imagePath: 'payment_icon_3.png',
                      ),
                      title: "Domino's Pizza",
                      price: "-\$32.75",
                      date: 'Dec 20, 6:45 PM',
                      completedOrPending: 'Completed',
                      CardName: '**** 4532 • Visa',
                    ),
                    SizedBox(height: 20),
                    _PaymentItem(
                      context,
                      image: UiHelper.CustomImage(
                        imagePath: 'payment_icon_4.png',
                      ),
                      title: 'Starbucks',
                      price: "-\$12.50",
                      date: 'Dec 19, 8:30 AM',
                      completedOrPending: 'Pending',
                      CardName: '**** 8976 • Mastercard',
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This Month',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '\$248.64',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Text(
                                        'Total Spent',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF6B7280),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '23',
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Color(0xFFFF6B35),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Orders',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF6B7280),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Divider(),
                            SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Most Used Card',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF6B7280),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Visa **** 4532',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Average Order',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF6B7280),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '\$21.68',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
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
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _PaymentItem(
  BuildContext context, {
  Widget? image,
  required String title,
  required String price,
  required String date,
  required String completedOrPending,
  required String CardName,
}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 150,
    decoration: BoxDecoration(
      color: Color(0xFFFFFFFF),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  image!,
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFF6B7280),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    price,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 5),
                  Text(
                    completedOrPending,
                    style: TextStyle(
                      color: completedOrPending == 'Pending'
                          ? Colors.red
                          : Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 8),
          Text(
            CardName,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF6B7280),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    ),
  );
}
