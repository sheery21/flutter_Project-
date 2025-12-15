
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_4_start/newPage2.dart';
import 'package:flutter_4_start/newPage.dart';

class newPage1 extends StatefulWidget {
  final String nameFromHome;
  newPage1(this.nameFromHome);

  @override
  _newPage1State createState() => _newPage1State();
}

class _newPage1State extends State<newPage1> {

  var myOpacity = 1.0;
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello New Page 1'),
      ),
      body: Container(
        color: Colors.grey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(opacity: myOpacity, duration: Duration(seconds: 2),curve: Curves.fastLinearToSlowEaseIn,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                ),),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () {
                myOpacity = 0.0;
                setState(() {
                  if(isVisible){
                    myOpacity = 0.0;
                    isVisible = false;
                  }else{
                    myOpacity = 1.0;
                    isVisible = true;
                  }
                });
              }, child: Text("Animate Opacity"),),
              SizedBox(height: 10,),
             ElevatedButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => newPage2(widget.nameFromHome),));
             }, child: Text('Go To New Page')),
            ],
          ),
        ),
      ),
      );
  }

}
