
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_4_start/BmiApp.dart';
import 'package:flutter_4_start/main.dart';

class appPage extends StatefulWidget{
  final String nameFromHome;
  appPage(this.nameFromHome);

  @override
  _appPageState createState() => _appPageState();

}
class _appPageState extends State<appPage> {

  RangeValues values = RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(values.start.toString(), values.end.toString());

    return Scaffold(
    appBar: AppBar(
      title: Text('Hello New  appPage'),
    ),
      body:
      Container(
      color: Colors.grey,
      child: Center(
        widthFactor: double.infinity,
        heightFactor: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSlider(
                values: values,
                divisions: 20,
                min: 0,
                max: 100,
                labels: labels,
                onChanged: (newValue){
                  values = newValue;
                  setState(() {});
            }),
            SizedBox(height: 20,),
            Text('Start : ${values.start}, End ${values.end}',style: TextStyle(fontSize: 20),),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => bmiApp(widget.nameFromHome),));
            }, child: Text('Go to BMI App Page'),),
          ],
        ),
      ),
    ),
    );
  }
}

