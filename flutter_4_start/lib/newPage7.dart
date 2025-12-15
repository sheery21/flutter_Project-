
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_4_start/newPage8.dart';

class newPage7 extends StatefulWidget{
     final String nameFromHome;
     newPage7(this.nameFromHome);
  @override
  _newPage7State createState() => _newPage7State();
}
class _newPage7State extends State<newPage7> {

  var arrData =[
    {'name':'Ticklly','age' : "20",}
    ,{"name": 'Ticklly',"age": "20"}
    ,{ "name" :"DoneNest" ,"age": "20"}
    ,{ "name" :"ZapDone" ,"age": "20"}
    ,{ "name" :"Tasklyst" ,"age": "20"}
    ,{ "name" :"QuickDoo" ,"age": "20"}
    ,{ "name" :"TodoNest" ,"age": "20"}
    ,{ "name" :"ChoreGo" ,"age": "20"}
    ,{ "name" :"ListHype" ,"age": "20"}
    ,{"name": "Ticklly","age" : "20"}
    ,{"name": "DoneNest","age" : "20" }
    ,{"name": "ZapDone","age" : "20" }
    ,{"name": "Tasklyst" , "age" : "20"}
    ,{"name": "QuickDoo" , "age" : "20"}
    ,{"name": "TodoNest" , "age" : "20"}
    ,{"name": "ChoreGo" , "age" : "20"}
    ,{"name": "ListHype" , "age" : "20"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('Hello New Page 7'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: SizedBox(
                height: 500,
                child: ListView(
                  children: arrData.map((value) => ListTile(
                        leading : Icon(Icons.face),
                        title: Text(value['name'].toString()),
                        trailing: CircleAvatar(
                            radius: 20,
                            child: Text(value['age'].toString())),
                      )).toList() ,
                ),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => newPage8(widget.nameFromHome),));
    }, child: Text("Go to the Next Page"))
          ],
        ),
      ),
    );
  }
}