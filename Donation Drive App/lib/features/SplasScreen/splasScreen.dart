import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _yAnimation;
  late Animation<double> _sizeAnimation;

  bool started = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5200),
    );

    // 1. Movement Animation (Drop & Bounce)
    _yAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -500.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeInOutCubic)),
        weight: 35,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: -60.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 8,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -60.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 8,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: -40.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 7,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -40.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 7,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: -20.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 6,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -20.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 6,
      ),
      // Movement stop ho jayegi expansion ke waqt
      TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 23),
    ]).animate(_controller);

    startSplash();
  }

  // Size animation ko build method se pehle screen size ke mutabiq set karenge
  void _setupSizeAnimation(double screenHeight, double screenWidth) {
    // Screen ke kisi bhi kone ko cover karne ke liye diagonal size chahiye hota hai
    double finalSize = screenHeight > screenWidth
        ? screenHeight * 2.5
        : screenWidth * 2.5;

    _sizeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween<double>(75.0), weight: 55),
      // Heartbeat 1
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 75.0,
          end: 110.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 5,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 110.0,
          end: 75.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 5,
      ),
      // Heartbeat 2
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 75.0,
          end: 140.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 5,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 140.0,
          end: 85.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 5,
      ),
      // FINAL EXPAND (Full Screen)
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 85.0,
          end: finalSize,
        ).chain(CurveTween(curve: Curves.easeInQuart)),
        weight: 25,
      ),
    ]).animate(_controller);
  }

  Future<void> startSplash() async {
    await Future.delayed(const Duration(milliseconds: 200));
    if (!mounted) return;
    setState(() => started = true);

    _controller.forward();

    // Animation khatam hone ka wait karein
    await _controller.forward().then((value) {
      Get.offAllNamed("/logIn");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Screen size ke mutabiq animation initialize karein
    if (started) {
      _setupSizeAnimation(
        MediaQuery.of(context).size.height,
        MediaQuery.of(context).size.width,
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: started
          ? AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Center(
                  child: Transform.translate(
                    offset: Offset(0.0, _yAnimation.value),
                    child: Container(
                      width: _sizeAnimation.value,
                      height: _sizeAnimation.value,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                );
              },
            )
          : const SizedBox(),
    );
  }
}
