import 'package:flutter/material.dart';

void main (){
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:Colors.cyan
      ),
      home:DashBoarScreen(),
    );
  }
}
class DashBoarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                margin: EdgeInsets.all(10),
                height: 40,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.lightGreenAccent
                ),
                child: Text('hello', ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black
              ),
              child: Text('hello', ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.greenAccent
              ),
              child: Text('hello', ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.lightGreen
              ),
              child: Text('hello', ),
            ),
          ),
        ],
      )
    );
  }
}
