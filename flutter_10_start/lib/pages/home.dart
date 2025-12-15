import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Column(children: [
        Stack(
          children: [
            Image.asset(
              'images/natureImage.jpg',
              width: MediaQuery.of(context)
              .size.width,height: MediaQuery
              .of(context).size.height/2.5,
              fit: BoxFit.cover,),
            Padding(
              padding: const EdgeInsets.only(top: 40.0,right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Material(
                    elevation: 3.0,
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.asset("images/boyIcon.png",width: 60,height: 60,fit: BoxFit.cover,)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 140.0,left: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Travelers',style: TextStyle(color: Colors.white,fontSize: 60.0,fontWeight: FontWeight.w500 , fontFamily: 'Lato'),),
                  Text('Travel Community App',style: TextStyle(color: Colors.white70,fontSize: 20.0,fontWeight: FontWeight.w500 , fontFamily: 'Lato'),),
                ],
              ),
            ),
            Container(
              child: ,
            ),
          ],
        ),
      ],),),
    );
  }
}
