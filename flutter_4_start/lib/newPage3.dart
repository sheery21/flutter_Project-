
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_4_start/newPage4.dart';

class newPage3 extends StatefulWidget {
     final String nameFromHome;
     newPage3(this.nameFromHome);
  @override
  _newPage3State createState() => _newPage3State();
}

class _newPage3State extends State<newPage3> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello New Page 3'),
      ),
      body: Container(
        height: 700,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => newPage4(widget.nameFromHome),));
                },
                child: Hero(
                    tag: 'background',
                    child: Image.network('https://cdn.pixabay.com/photo/2018/01/24/18/05/background-3104413_1280.jpg',height: 300,)),
              )
            ],
          ),
        ),
      ),
    );
  }
}