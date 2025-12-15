import 'package:flitter_9_start/service/widget_support.dart';
import 'package:flutter/material.dart';

class Onbaording extends StatefulWidget {
  const Onbaording({super.key});

  @override
  State<Onbaording> createState() => Onbaording_State();
}

class Onbaording_State extends State<Onbaording> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        color: Color(0xFFECECE7),
        margin: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Image.asset('images/onbaord.png'),
            SizedBox(height: 20.0,),
            Container(
              child:
              Column(
                children: [
                  Text('The Fastest', style: AppWidget.HeadLineTextFeildStyle()),
                  Text('Food Delivery' , style: AppWidget.HeadLineTextFeildStyle(),),
                  SizedBox(height: 30.0,),
                  Text('Craving something delicious?\n Order now and get Your favorites\n'
                      ' delivered fast!',textAlign: TextAlign.center,
                    style: AppWidget.SimpleTextFeildStyle(),),
                  SizedBox(height: 30.0,),
                  Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width/2,
                    decoration: BoxDecoration(color: Color(0xff8c592a),borderRadius:BorderRadius.circular(20)),
                    child: Center(child: Text('Get Started',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),)),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
