import 'package:flitter_9_start/pages/buttomnav.dart';
import 'package:flitter_9_start/pages/login.dart';
import 'package:flutter/material.dart';

import '../service/shared_pref.dart';

class toGo extends StatefulWidget {
  const toGo({super.key});

  @override
  State<toGo> createState() => _toGoState();
}

class _toGoState extends State<toGo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4),()=>whereToGo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        color: Color(0xffef2b39),
        child: Center(
          child: Image.asset('images/food2go.png',width: 250,height: 250,),
        ),
      ),
    );
  }

  void whereToGo() async {

    bool isLoggedIn = await SharedpreferenceHelper.getUserLoggedIn() ?? false;

    if (isLoggedIn) {
      // user already login hai
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ButtomNav()));
    } else {
      // user login page par jayega
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
    }

  }

}
