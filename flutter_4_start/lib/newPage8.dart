


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_4_start/newPage9.dart';

class newPage8 extends StatefulWidget{
  final String nameFromHome;
  newPage8(this.nameFromHome);
  @override
  _newPage8State createState() => _newPage8State();
}

class _newPage8State extends State<newPage8> with SingleTickerProviderStateMixin{

  late  Animation animation;
  late AnimationController animationController;
  late Animation colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation = Tween(begin: 200.0, end: 0.0).animate(animationController);
    colorAnimation = ColorTween(begin: Colors.pinkAccent, end: Colors.blue).animate(animationController );
    animationController.addListener((){
      print(animation.value);
      setState(() {});
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello newPage8State'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: animation.value,
                width: animation.value,
                color: colorAnimation.value,
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => newPage9(widget.nameFromHome),));
            }, child: Text("Click"))
          ],
        ),
      ),
    );
    
  }
}