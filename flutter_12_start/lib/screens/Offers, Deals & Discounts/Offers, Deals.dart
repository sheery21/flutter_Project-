import 'package:flutter/material.dart';
import 'package:flutter_12_start/widgets/uihelpar.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersState();
}

class _OffersState extends State<OffersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Offers, Deals & Discounts',
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: const Color(0xFFF9FAFB),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Current Deals', style: UiHelper.blackTextFeildStyle()),
                  Text('View All', style: UiHelper.blueTextFeildStyle()),
                ],
              ),
              const SizedBox(height: 20),

              // Current Deal Card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFF5B595980)),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiHelper.CustomRadiusImage(
                      imagePath: 'offer_burger.png',
                      width: 95.74,
                      height: 130.06,
                      topLeft: 10,
                      topRight: 10,
                      bottomLeft: 10,
                      bottomRight: 10,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),

                    // Deal Info
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title + Rating Row
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '20% off your',
                                        style: UiHelper.blackTextFeildStyle(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'first order',
                                        style: UiHelper.blackTextFeildStyle(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Color(0xFFFCD151),
                                      size: 18,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '4.8',
                                      style: UiHelper.blackTextFeildStyle(),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 5),
                            Text(
                              'Double Cheese Combo',
                              style: UiHelper.ShortTextFeildStyle(),
                            ),
                            const SizedBox(height: 10),

                            // Price & Button
                            Row(
                              children: [
                                Text(
                                  '\$12.99',
                                  style: UiHelper.blueTextFeildStyle(),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF366190),
                                            Color(0xFF2D7ED7),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 40,
                                        child: Text(
                                          'Order Now',
                                          style: UiHelper.witeTextFeildStyle(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Ad Free Header
              Text('Ad-Free Experience', style: UiHelper.blackTextFeildStyle()),
              const SizedBox(height: 15),

              // Ad-Free Section
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFDFEFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: UiHelper.CustomImage(imagePath: 'go_to.png'),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Go Ad-Free',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Subscribe to get an ad-free experience and',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'unlock premium features without',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'interruptions',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Subscription Card
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Monthly Subscription',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                              Text(
                                '\$2.99',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF333333),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'No ads • Premium features • Priority support',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6B7280),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Subscribe Button
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3078BE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: Text(
                        'Subscribe Now',
                        style: UiHelper.witeTextFeildStyle(),
                      ),
                    ),

                    const SizedBox(height: 10),
                    const Text(
                      'Cancel anytime • 7-day free trial',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 20),
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
