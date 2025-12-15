import 'package:flutter/material.dart';

class AppWidget{
  static TextStyle HeadLineTextFeildStyle(){
    return
      TextStyle(
          color: Colors.black,fontSize: 35.0,
          fontWeight: FontWeight.bold);
  }
  static TextStyle SimpleTextFeildStyle(){
    return
      TextStyle(
          color: Colors.black,fontSize: 16.0,
          fontWeight: FontWeight.bold);
  }
  static TextStyle whiteTextFeildStyle(){
    return
      TextStyle(
          color: Colors.white,fontSize: 18.0,
          fontWeight: FontWeight.bold);
  }
  static TextStyle boldTextFeildStyle(){
    return
      TextStyle(
          color: Colors.black,fontSize: 20.0,
          fontWeight: FontWeight.bold);
  }



  static TextStyle priceTextFeildStyle(){
    return
      TextStyle(
          color: Color.fromARGB(174,0,0,0),fontSize: 24.0,
          fontWeight: FontWeight.bold);
  }
  static TextStyle boldwhiteTextFeildStyle(){
    return
      TextStyle(
          color: Colors.white,fontSize: 24.0,
          fontWeight: FontWeight.bold);
  }
  static TextStyle SignUpTextFeildStyle(){
    return
      TextStyle(
          color: Color.fromARGB(174,0,0,0),fontSize: 20.0,
          fontWeight: FontWeight.bold);
  }static TextStyle LogInBtnTextFeildStyle(){
    return
      TextStyle(
          color: Color(0xffef2b39),fontSize: 20.0,
          fontWeight: FontWeight.bold);
  }
}
