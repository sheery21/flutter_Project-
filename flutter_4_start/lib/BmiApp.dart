

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_4_start/animationPage.dart';

class bmiApp extends StatefulWidget{
    final String nameFromHome;
    bmiApp(this.nameFromHome);

    @override
  _bmiAppState createState() => _bmiAppState();

  }

  class _bmiAppState extends State<bmiApp> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var bgColor;
  var result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello New  bmiApp'),
      ),
      body:
      Container(
        color: Colors.blueGrey,
        child: Center(
          widthFactor: double.infinity,
          heightFactor: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
               child: Column(
                 children: [
                   Text( 'BMI',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                   SizedBox(height: 20,),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextField(
                       controller: wtController,
                       keyboardType: TextInputType.number,
                       style: TextStyle(color: Colors.black,fontSize: 18),
                       decoration: InputDecoration(
                         hintText: 'Enter Your Weight (in kgs)',                    prefixIcon: Icon(Icons.line_weight),
                         filled: true,
                         fillColor: Colors.grey,
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(20),
                             borderSide: BorderSide.none
                         ),
                       ),
                     ),
                   ),

                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextField(
                       controller: ftController,
                       keyboardType: TextInputType.number,
                       style: TextStyle(color: Colors.black,fontSize: 18),
                       decoration: InputDecoration(
                         prefixIcon: Icon(Icons.height),
                         hintText: 'Enter Your Hight (in kgs)',
                         filled: true,
                         fillColor: Colors.grey,
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(20),
                             borderSide: BorderSide.none
                         ),
                       ),
                     ),
                   ),

                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextField(
                       controller: inController,
                       keyboardType: TextInputType.number,
                       style: TextStyle(color: Colors.black,fontSize: 18),
                       decoration: InputDecoration(
                         prefixIcon: Icon(Icons.height),
                         hintText: 'Enter Your Hight (in kgs)',
                         filled: true,
                         fillColor: Colors.grey,
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(20),
                             borderSide: BorderSide.none
                         ),
                       ),
                     ),
                   ),
                   SizedBox(height: 20,),
                   ElevatedButton(onPressed: (){
                     var wt = wtController.text.toString();
                     var ft = ftController.text.toString();
                     var inch = inController.text.toString();
                     if(wt != '' && ft != '' && inch != ''){
                       var iwt = int.parse(wt);
                       var ift = int.parse(ft);
                       var ininch = int.parse(inch);
                        var tInch = (ift * 12) + ininch;
                        var tCm = tInch * 2.54;
                        var tM = tCm / 100;
                        var bmi = iwt / (tM * tM);

                        if(bmi > 25){
                          bgColor = Colors.orange;
                        }else if(bmi > 18){
                          bgColor = Colors.green;
                        }else{
                          bgColor = Colors.red;
                        }
                        setState(() {
                        result = 'Your BMI is ${bmi.toStringAsFixed(2)}';
                       });
                     }else{
                       setState(() {
                         result = 'Please fill all the required blanks!!';
                       });
                     }

                   }, child: Text('Click'),
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.blueGrey,
                       foregroundColor: Colors.white,
                       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                       textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(12),
                       ),
                   ),
                   ),
                   SizedBox(height: 10,),
                   Text(result,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                 ],
               ),
              ),

              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => animationPage(widget.nameFromHome),));
              }, child: Text('Click'),)
            ],
          ),
        ),
      )
      ,


    );


  }

  }



