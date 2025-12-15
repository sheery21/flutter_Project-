import 'package:flutter/material.dart';
import 'package:flutter_12_start/screens/PaymentInfo/paymentInfo.dart';
import 'package:flutter_12_start/screens/PaymentScreen/paymentScreen.dart';
import 'package:flutter_12_start/screens/Profile/Profile.dart';
import 'package:flutter_12_start/screens/Rewards/rewards.dart';
import 'package:flutter_12_start/screens/YourOrder/yourOrder.dart';
import '../../widgets/uihelpar.dart';
import '../Login/loginPage.dart';

class Sidenav extends StatefulWidget {
  const Sidenav({super.key});

  @override
  State<Sidenav> createState() => _SidenavState();
}

class _SidenavState extends State<Sidenav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE0F1FF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Center(
            child: UiHelper.CustomImage(
              imagePath: 'user_image1.png',
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Sophia',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              child: const Text(
                'View your profile',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4A739C),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      _buildMenuItem(
                        context,
                        icon: Icons.receipt,
                        title: "Orders",
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const YourorderPage(),
                          ),
                        ),
                      ),
                      _divider(),

                      _buildMenuItem(
                        context,
                        icon: Icons.account_balance_wallet,
                        title: "Payments",
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Paymentscreen(),
                          ),
                        ),
                      ),
                      _divider(),

                      _buildMenuItem(
                        context,
                        icon: Icons.notifications_active,
                        title: "Notifications / Updates",
                        onTap: () {},
                      ),
                      _divider(),

                      _buildMenuItem(
                        context,
                        icon: Icons.payment,
                        title: "Payment Info",
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Paymentinfo(),));
                        },
                      ),
                      _divider(),

                      _buildMenuItem(
                        context,
                        iconWidget: UiHelper.CustomImage(imagePath: 'Coin_icon.png'),
                        title: "Rewards",
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  Rewards()));
                        },
                      ),
                      _divider(),

                      _buildMenuItem(
                        context,
                        icon: Icons.share,
                        title: "Share the App on Social Network",
                        onTap: () {},
                      ),
                      _divider(),

                      _buildMenuItem(
                        context,
                        icon: Icons.text_snippet,
                        title: "Terms & Conditions",
                        onTap: () {},
                      ),
                      _divider(),

                      _buildMenuItem(
                        context,
                        icon: Icons.help,
                        title: "Help Center",
                        onTap: () {},
                      ),
                      _divider(),

                      _buildMenuItem(
                        context,
                        icon: Icons.settings,
                        title: "Settings",
                        onTap: () {},
                      ),

                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF366190), Color(0xFF2D7ED7)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.logout, color: Colors.white, size: 25),
                              SizedBox(width: 10),
                              Text(
                                'Logout',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFF7FAFC),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
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

  Widget _divider() => const Divider(color: Color(0xFFE0F1FF));

  Widget _buildMenuItem(
      BuildContext context, {
        IconData? icon,
        Widget? iconWidget,
        required String title,
        VoidCallback? onTap,
      }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                iconWidget ??
                    Icon(icon, color: const Color(0xFF3078BE), size: 25),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios,
                size: 18, color: Color(0xFF9CA3AF)),
          ],
        ),
      ),
    );
  }
}