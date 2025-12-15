import 'package:firebase_auth/firebase_auth.dart';
import 'package:flitter_9_start/pages/buttomnav.dart';
import 'package:flitter_9_start/pages/signup.dart';
import 'package:flitter_9_start/service/widget_support.dart';
import 'package:flutter/material.dart';
import '../service/shared_pref.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late String mtText = '';

  String email ='', password = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async{
    email = emailController.text.trim();
    password = passwordController.text.trim();
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ButtomNav()));
    }on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided';
      } else {
        // Ye line tumhara "badly formatted email" aur other errors cover karegi
        message = e.message ?? 'Something went wrong';
      }

      setState(() {
        mtText = message; // UI pe dikhega
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.orangeAccent,
        content: Text(message, style: TextStyle(fontSize: 18.0)),
      ));
    }
  }


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
                  height: MediaQuery.of(context).size.height/1.75,
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
                        Center(child: Text('LogIn',style: AppWidget.HeadLineTextFeildStyle(),)),
                        SizedBox(height: 25.0,),


                        Text('Email',style: AppWidget.SignUpTextFeildStyle(),),
                        SizedBox(height: 5.0,),
                        Container(
                          height: 40.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Color(0xFFececf8),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress
                          ,decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your email',
                            hintStyle: AppWidget.SimpleTextFeildStyle(),
                            prefixIcon: Icon(Icons.email_outlined,color: Color(0xffef2b39),size: 30.0,),
                          ),),
                        ),
                        Text(mtText,style: TextStyle(color: Colors.redAccent,fontSize: 18.0)),

                        SizedBox(height:10.0,),
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
                            controller: passwordController
                            ,obscureText: true
                          ,decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your password',
                            hintStyle: AppWidget.SimpleTextFeildStyle(),
                            prefixIcon: Icon(Icons.password_outlined,color: Color(0xffef2b39),size: 30.0,),
                          ),),
                        ),
                        Text(mtText,style: TextStyle(color: Colors.redAccent,fontSize: 18.0)),
                        SizedBox(height: 10.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Forgot Password?',style: AppWidget.SignUpTextFeildStyle(),),
                          ],
                        ),
                        SizedBox(height: 50.0,),
                      Center(
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: const Color(0xffef2b39),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              final enteredEmail = emailController.text.trim();
                              final enteredPassword = passwordController.text.trim();

                              if (enteredEmail.isNotEmpty && enteredPassword.isNotEmpty) {
                                email = enteredEmail;
                                password = enteredPassword;

                                await SharedpreferenceHelper.saveUserLoggedIn(true);
                                print('📧 Email: $email  🔑 Password: $password');

                                login(); // API call ya auth function
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: const Color(0xffef2b39),
                                    content: const Text(
                                      'Please fill all the fields',
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ),
                                );
                                mtText = 'Please fill all the fields';
                              }
                            },
                            child: Center(
                              child: Text(
                                'Log In',
                                style: AppWidget.boldwhiteTextFeildStyle(),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?",style: AppWidget.SignUpTextFeildStyle(),),
                              GestureDetector(
                                onTap: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                                },
                                child: Text('Sign Up',style: AppWidget.LogInBtnTextFeildStyle(),),
                              ),
                            ],
                          ),
                        )
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
}
