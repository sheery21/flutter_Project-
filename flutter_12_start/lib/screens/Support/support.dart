import 'package:flutter/material.dart';
import 'package:flutter_12_start/widgets/uihelpar.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportState();
}

class _SupportState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Support',
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF9FAFB),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFE7EDF4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 6.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          width: 148,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Chat with Admin',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF333333),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Chat with Delivery Person',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4A739C),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
                      'Admin',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4A739C),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      UiHelper.CustomRadiusImage(imagePath: 'admin_imag.png'),
                      SizedBox(width: 10),
                      Container(
                        width: 285,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFFE7EDF4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 13.0, left: 8.0),
                          child: Text(
                            'Hi there! How can I help you today?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF333333),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: Text(
                      'Sophia',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4A739C),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF3078BE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 13.0, left: 8.0),
                          child: Text(
                            'I have a question about my recent order.',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFF7FAFC),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      UiHelper.CustomRadiusImage(imagePath: 'user_imag.png'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
                      'Admin',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4A739C),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      UiHelper.CustomRadiusImage(imagePath: 'admin_imag.png'),
                      SizedBox(width: 10),
                      Container(
                        width: 285,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color(0xFFE7EDF4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 13.0, left: 8.0),
                          child: Text(
                            'Sure, I can help with that. What'
                            's your order number?',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF333333),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 285),
              Container(
                child: Row(
                  children: [
                    UiHelper.CustomRadiusImage(imagePath: 'user_imag.png'),
                    SizedBox(width: 10),
                    Container(
                      width: 300,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFFE7EDF4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Type a message',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF3078BE),
                              ),
                            ),
                            Icon(
                              Icons.image_outlined,
                              color: Color(0xFF4A739C),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
