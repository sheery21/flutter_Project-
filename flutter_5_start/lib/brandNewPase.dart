
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_5_start/homepage.dart';
import 'package:flutter_5_start/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class brandNewPase extends StatefulWidget{

  @override
  brandNewPaseState createState() => brandNewPaseState();
}

class brandNewPaseState extends State<brandNewPase>{

  static const String KEYLOGIN = 'login';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    whereToGo();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(child: Text('brandNewPase'),),
      // ),
      body: Container(
        color: Color(0xFF1DA1F2),
        child: Center(
          child: Image.network('https://cdn-icons-png.flaticon.com/512/10453/10453654.png',width: 250,height: 250,),
        ),
      ),
    );
  }

  void whereToGo() async {

    var sharedPref = await SharedPreferences.getInstance();
    
   var isLogIN = sharedPref.getBool(KEYLOGIN);


    Timer(Duration(seconds: 4),(){
   if (isLogIN != null ){

     if (isLogIN){
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homepage('home')));
     }else{
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginPage('login')));
     }
   }else{
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginPage('login')));
   }

    });
  }

}
