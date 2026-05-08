import 'package:donation_drive/features/SplasScreen/LiquidPainter/liquidPainter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiquidSplashScreen extends StatefulWidget {
  const LiquidSplashScreen({super.key});

  @override
  State<LiquidSplashScreen> createState() => _LiquidSplashScreenState();
}

class _LiquidSplashScreenState extends State<LiquidSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );

    start();
  }

  Future<void> start() async {
    await Future.delayed(const Duration(milliseconds: 300));

    _controller.forward();

    await Future.delayed(const Duration(milliseconds: 2600));

    bool isAdminLoggedIn = false;

    if (isAdminLoggedIn) {
      Get.offAllNamed("/BottomNavbar");
    } else {
      Get.offAllNamed("/logIn");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            children: [
              // LIQUID BACKGROUND
              CustomPaint(
                size: size,
                painter: LiquidPainter(progress: _animation.value),
              ),

              // CENTER TEXT (smooth fade OUT)
              Center(
                child: Opacity(
                  opacity: (1 - (_animation.value * 1.2)).clamp(0.0, 1.0),
                  child: const Text(
                    "Donation Drive",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
