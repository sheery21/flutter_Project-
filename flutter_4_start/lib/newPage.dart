

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_4_start/lntroPage.dart';

class newPage extends StatelessWidget{

  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return Scaffold (
     appBar: AppBar(
       title: Text('Hello New Page'),
     ),
     body:
     SingleChildScrollView(
       child: Container(
         width: double.infinity,
         height: 800,
         color:  Colors.purpleAccent.shade200,
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('What is your name?',
                 style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
               ),
               SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextField(
                   controller: nameController,style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   color: Colors.black,
                 ),
                   decoration: InputDecoration(
                       filled: true,
                       fillColor: Colors.grey,
                       border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                           borderSide: BorderSide.none
                       )
                   ),
                 ),
               ),
               SizedBox(height: 10,),
               ElevatedButton(
                   onPressed: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                        builder: (context) => IntroPage(nameController.text.toString())
                       ),
                     );
               }, child: Text('Click')),

             ],
           ),
         ),
       ),
     )
     ,
   );
  }

}