
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_4_start/newPage.dart';

class brandNewPage extends StatefulWidget{
  @override
  State<brandNewPage> createState() => _brandNewPageState();
}


class _brandNewPageState extends State<brandNewPage> {



  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => newPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(

           body:
          SingleChildScrollView(
             child: Container(
               width: double.infinity,
               height: 900,
               color: Colors.grey,
       child: Center(
         child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text('Welcome ',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,),),
             ElevatedButton(onPressed: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => newPage(),
                 ),
               );
             }, child: Text('hello')
             )
           ],
         ),
       ),
     ),
      )
    ,);
  }
}