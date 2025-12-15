

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_4_start/newPage3.dart';

class newPage2 extends StatefulWidget{
  final String nameFromHome;
  newPage2(this.nameFromHome);
  @override
  _newPage2State createState() => _newPage2State();
}

class _newPage2State extends State<newPage2> {

  bool isFirst = true;

  void reload(){
    setState(() {
      if (isFirst){
      isFirst = false;
      }else{
        isFirst = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello New Page 2'),
      ),
      body: Container(
        color: Colors.grey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedCrossFade(
                duration: Duration(seconds: 2),
             firstChild: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
          ),
              secondChild:
               Image.network( 'https://images.ctfassets.net/kftzwdyauwt9/5GOIjwbUjLZHoGhX6q5oQg/d2984681d2a9466b71b7ca7632a8481c/Anastronautridingahorseinaphotorealisticstyle0.jpg?w=3840&q=90&fm=webp',
             width: 250,height: 250,),
                sizeCurve: Curves.slowMiddle,
                crossFadeState:isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
              ElevatedButton(onPressed: (){

                setState(() {
                  reload();
                });
              }, child: Text('Click')),

              SizedBox(height: 10,),

              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => newPage3(widget.nameFromHome),));
              }, child: Text('Go to the Next Page'))
            ],
          ),

        ),
      ),
      );
  }
}
