

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class newPage10 extends StatefulWidget{
  final String nameFromHome;
  newPage10(this.nameFromHome);
  @override
  _newPage10State createState() => _newPage10State();
}

class _newPage10State extends State<newPage10>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  var myController = TextEditingController();
  static const String KEYNAME = 'name';

  var nameValue = 'No Value Saved';

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('hello newPage10'),
       ),
       body: Container(
         child:  Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextField( controller: myController,
                              style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                              decoration: InputDecoration(
                                label: Text('Name'),
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                     borderSide: BorderSide(color: Colors.grey.shade900,width: 20)
                   )
                              ),
                 ),
               ),
               SizedBox(height: 20,),
               ElevatedButton(onPressed: () async {
                 print( myController.text);
                 var text = myController.text.toString();

                 var prefs  = await SharedPreferences.getInstance();
                 
                 prefs.setString(KEYNAME, text);
               }, child: Text("Save!!"),style: ElevatedButton.styleFrom(
                 shadowColor: Colors.black,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(1),
                   side: BorderSide(color: Colors.black,width: 2),
                 )
               )),
               SizedBox(height: 20,),
               Text(nameValue)
             ],
           ),
         ),
       ),
     );
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();

    var getName = prefs.getString(KEYNAME);

    setState(() {
      nameValue = getName ?? 'No Value Saved';
    });

  }

}