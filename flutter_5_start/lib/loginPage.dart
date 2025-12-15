

 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_5_start/brandNewPase.dart';
import 'package:flutter_5_start/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginPage extends StatefulWidget{
      final String longinPage;
      loginPage(this.longinPage);

      @override
   _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage>{

  var emt = '';
  var emailController = TextEditingController();
  var passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('login',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27,
            color: Colors.white,
          ),
        ),
          ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                   Container(
                    height: 600,
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network('https://cdn-icons-png.flaticon.com/512/9187/9187604.png',width: 100,height: 100,),
                        SizedBox(height: 40,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(controller: emailController,decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(width: 2,color: Colors.black),

                            ),
                            labelText: 'email',
                            hintText: 'enter email',
                            prefixIcon: Icon(Icons.email),
                          ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(controller: passController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(width: 2,color: Colors.black),
                              ),
                              labelText: 'password',
                              hintText: 'enter password',
                              prefixIcon: Icon(Icons.password),
                            ),

                          ),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(onPressed: () async {


                             if(emailController.text.isNotEmpty && passController.text.isNotEmpty
                                 && emailController.text.contains('@')
                             ){
                               var sharedPref = await SharedPreferences.getInstance();
                               sharedPref.setBool(brandNewPaseState.KEYLOGIN, true);
                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homepage(widget.longinPage)));
                             } else if(emailController.text.isEmpty || passController.text.isEmpty){
                              setState(() {
                                emt = 'please enter email and password';
                              });
                            }else if(!emailController.text.contains('@')){
                              setState(() {
                                emt = 'please enter valid email';
                              });
                            }else if(!emailController.text.isEmpty){
                               setState(() {
                                 emt = 'please enter valid password';
                               });
                             }

                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homepage(widget.longinPage)));
                          }, child: Text('login',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              backgroundColor: Colors.blue,
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(emt,style: TextStyle(color: Colors.red),),
                    ],
                    ),
                  ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}