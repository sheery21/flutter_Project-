

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_4_start/newPage6.dart';

class newPage5 extends StatefulWidget{
  final String nameFromHome;
  newPage5(this.nameFromHome);
  @override
  _newPage5State createState() => _newPage5State();

}

class _newPage5State extends State<newPage5> {

  var arrIndx= [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 ,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello New Page 5'),
      ),
      body:
      SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: SizedBox(
                  height: 500,
                  child: Center(
                    child: ListWheelScrollView(
                        itemExtent: 150,
                        children: arrIndx.map((value) =>Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Center(child: Text('$value', style: TextStyle(fontSize: 35,fontFamily: "festFont"),)),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade400,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black,width: 2),
                            ),
                          ),
                        ) ).toList()
                        ),
                  ),
                ),
              ),
              SizedBox(height: 100,),
               ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => newPage6(widget.nameFromHome)));
              }, child: Text('Go to the Next Page')),

            ],
          ),
        ),
      ),
    );
  }

}