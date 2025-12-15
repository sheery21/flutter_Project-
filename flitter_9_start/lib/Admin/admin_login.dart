
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flitter_9_start/Admin/home_admin.dart';
import 'package:flutter/material.dart';

import '../service/widget_support.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

  final myText = '';
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2.6,
              padding: EdgeInsets.only(top: 20.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color(0xffffefbf),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0),bottomRight: Radius.circular(40.0))),
              child: Column(
                children: [
                  Image.asset('images/pan.png', height:180,fit: BoxFit.fill, width:240 ),
                  Image.asset('images/foodlogo.png',height: 65.0,width: 170.0,fit: BoxFit.cover,),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only( top: MediaQuery.of(context).size.height/3.3, left: 20.0,right: 20.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Container(
                  padding: EdgeInsets.only(left: 20.0,right: 20.0),
                  height: MediaQuery.of(context).size.height/2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15.0,),
                        Center(child: Text('Admin',style: AppWidget.HeadLineTextFeildStyle(),)),
                        SizedBox(height: 25.0,),
                        Text('UserName',style: AppWidget.SignUpTextFeildStyle(),),
                        SizedBox(height: 5.0,),
                        Container(
                          height: 40.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Color(0xFFececf8),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: TextField(
                            controller: userNameController
                            , decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your userName',
                            hintStyle: AppWidget.SimpleTextFeildStyle(),
                            prefixIcon: Icon(Icons.person_2_outlined,color: Color(0xffef2b39),size: 30.0,),
                          ),),
                        ),
                        Text(myText,style: TextStyle(color: Colors.redAccent,fontSize: 18.0)),

                        SizedBox(height: 10.0,),
                        Text('Password',style: AppWidget.SignUpTextFeildStyle(),),
                        SizedBox(height: 5.0,),
                        Container(
                          height: 40.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Color(0xFFececf8),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: TextField(
                            controller: userPasswordController
                            ,obscureText: true
                            ,decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your password',
                            hintStyle: AppWidget.SimpleTextFeildStyle(),
                            prefixIcon: Icon(Icons.password_outlined,color: Color(0xffef2b39),size: 30.0,),
                          ),),
                        ),
                        Text(myText,style: TextStyle(color: Colors.redAccent,fontSize: 18.0)),
                        SizedBox(height: 30.0,),
                        Center(
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Color(0xffef2b39),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: MaterialButton(
                              onPressed: (){
                                loginAdmin();
                                print( "userNameController $userNameController userPasswordController $userPasswordController");
                              },
                              child: Text('LogIn',style: AppWidget.boldwhiteTextFeildStyle(),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void loginAdmin() async {
    final username = userNameController.text.trim();
    final password = userPasswordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color(0xffef2b39),
        content: Text('Please enter both username and password', style: TextStyle(fontSize: 18.0)),
      ));
      return;
    }

    final snapshot = await FirebaseFirestore.instance
        .collection("Admin")
        .where("username", isEqualTo: username)
        .where("password", isEqualTo: password)
        .get();

    if (snapshot.docs.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color(0xffef2b39),
        content: Text('Username or password incorrect', style: TextStyle(fontSize: 18.0)),
      ));
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeAdmin()),
      );
    }
  }

}


