import 'package:flutter/material.dart';
import 'package:flutter_4_start/newPage1.dart';
import 'package:flutter_4_start/newPage.dart';

class animationPage extends StatefulWidget {
  final String nameFromHome;
  animationPage(this.nameFromHome);

  @override
  _animationPageState createState() => _animationPageState();
}

class _animationPageState extends State<animationPage> {
  var _width = 400.0;
  var _height = 400.0;
  Decoration myDecor = BoxDecoration(
      color : Colors.blue,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Colors.black,width: 2),
  );
  bool flag = true;

  int step = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello New Animation'),

      ),
      body: Container(
        color: Colors.grey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                width: _width,
                height: _height,
                decoration: myDecor,
                duration: Duration(seconds: 2),
                curve: Curves.easeInCirc,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (step == 0) {
                      _width = 50;
                      _height = 50;
                      myDecor = BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 2),
                      );
                      flag = false;
                    } else  if ( step == 1){
                      _width = 100;
                      _height =100;
                      myDecor = BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [ BoxShadow( color: Colors.black,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),],
                        border: Border.all(color: Colors.black, width: 10),
                      );
                      flag = true;
                    }else  if ( step == 2){
                      _width = 200;
                      _height =200;
                      myDecor = BoxDecoration(
                        color: Colors.yellowAccent,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black, width: 15),
                        boxShadow: [ BoxShadow( color: Colors.black,
                          blurRadius: 30,
                          offset: Offset(4, 4),
                        ),],
                      );
                    }
                    step = (step + 1) % 4;
                    flag = !flag;
                  });
                },
                child: Text('Animate Size'),
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => newPage1(widget.nameFromHome)));
              }, child: Text("Go To New Page "))
            ],
          ),
        ),
      ),
    );
  }
}
