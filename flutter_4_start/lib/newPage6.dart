
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_4_start/newPage7.dart';

class newPage6 extends StatefulWidget{
  final String nameFromHome;
  newPage6 (this.nameFromHome);
  @override
  _newPage6State createState() => _newPage6State();
}
 class _newPage6State extends State<newPage6> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello New Page 6'),
      ),
      body: Container(
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors:[
                          Color(0xfffbc2eb),Color(0xffa6c1ee),
                        ],
                      begin: FractionalOffset(1.0, 0.2),
                      end: FractionalOffset(0.0, 1.1),

                    ),

                    ),
                  ),
                ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => newPage7(widget.nameFromHome),));
                }, child: Text('Go to the Next Page',))
            ],
          ),
        ),
      ),
      );
  }
 }