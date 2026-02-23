import 'package:flutter/material.dart';
import 'package:flutter_12_start/screens/Login/loginPage.dart';
import 'package:flutter_12_start/widgets/uihelpar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
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
          color: Color(0xFFF9FAFB),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: UiHelper.CustomImage(
                    imagePath: 'user_image1.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Sophia',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Center(
                  child: Text(
                    'Manage your profile',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4A739C),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Divider(color: Color(0xFF5B595980)),
                SizedBox(height: 15),
                Text(
                  'Personal & account detail',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4A739C),
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Icon(Icons.person, color: Color(0xFF3078BE), size: 25),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        Text(
                          'Olivia Bennett',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1A120F),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(color: Color(0xFF5B595980)),
                Row(
                  children: [
                    Icon(
                      Icons.female_outlined,
                      color: Color(0xFF3078BE),
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gender',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        Text(
                          'Female',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1A120F),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(color: Color(0xFF5B595980)),
                Row(
                  children: [
                    Icon(
                      Icons.date_range_outlined,
                      color: Color(0xFF3078BE),
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date of Birth',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        Text(
                          '1992-08-22',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1A120F),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(color: Color(0xFF5B595980)),
                Row(
                  children: [
                    Icon(Icons.phone, color: Color(0xFF3078BE), size: 25),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone Number',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        Text(
                          '+1 (555) 987-6543',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1A120F),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(color: Color(0xFF5B595980)),
                Row(
                  children: [
                    Icon(Icons.email, color: Color(0xFF3078BE), size: 25),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        Text(
                          'sofia.bennett@email.com',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1A120F),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(color: Color(0xFF5B595980)),
                Row(
                  children: [
                    Icon(Icons.password, color: Color(0xFF3078BE), size: 25),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        Text(
                          '+1 (555) 987-6543',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1A120F),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(color: Color(0xFF5B595980)),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Color(0xFF3078BE), size: 25),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        Text(
                          '123 Main Street, Apt 48, New York United.',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1A120F),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF3535),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Delete your account',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFF7FAFC),
                        ),
                      ),
                    ),
                  ),
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
