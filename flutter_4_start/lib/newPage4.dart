

 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_4_start/newPage5.dart';

class newPage4 extends StatefulWidget{
  final String nameFromHome;
  newPage4(this.nameFromHome);
  @override
  _newPage4State createState() => _newPage4State();
}

class _newPage4State extends State<newPage4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello New Page 4'),
      ),

      body: Container(

              child:  Column(
                children: [
                  Hero(
                      tag: 'background',
                      child: Image.network('https://i.pinimg.com/736x/2a/f4/f0/2af4f09c78e95b619c44ee9226bdc2de.jpg')
                  ),

                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => newPage5(widget.nameFromHome), // ✅ this works
                      ),
                    );
                  },
                    child: Text("Go To New Page"),)
                ],
              )
        ),
      );
  }



}