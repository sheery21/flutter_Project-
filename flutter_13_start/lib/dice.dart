import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  @override
    int leftDice = 1;
    int rightDice = 1;
    bool isRolling = false;

    @override
    void rollDice() async {
      if(isRolling) return;

      try {
        bool? canVibrate = await Vibration.hasVibrator();
        if (canVibrate == true) {
          Vibration.vibrate(duration: 100);
        }
      } catch (e) {
        print("Vibration check failed: $e");
        Vibration.vibrate(duration: 100); // fallback
      }

      isRolling = true;
      int rollCount = 0;

      Timer.periodic(Duration(milliseconds: 100), (timer) {
        setState(() {
        leftDice = Random().nextInt(6) + 1;
        rightDice = Random().nextInt(6) + 1;
        });
        rollCount++;
        if (rollCount >= 10) {
          timer.cancel();
          setState(() {
            leftDice = Random().nextInt(6) + 1;
            rightDice = Random().nextInt(6) + 1;
          });
          isRolling = false;
        }
      });
    }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.yellow, Colors.orangeAccent, Colors.deepOrange],
            center: Alignment.center,
            radius: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Roll The Dice',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/image/dice-$leftDice.png',
                    width: 100,
                    height: 100,
                  ),
                  Image.asset(
                    'assets/image/dice-$rightDice.png',
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: (){
                print('Roll the Dice');
                rollDice();
              },
              child: Text('Roll the Dice' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                shadowColor: Colors.black38,
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
