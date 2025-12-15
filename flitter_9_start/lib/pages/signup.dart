import 'package:firebase_auth/firebase_auth.dart';
import 'package:flitter_9_start/pages/buttomnav.dart';
import 'package:flitter_9_start/pages/login.dart';
import 'package:flitter_9_start/service/database.dart';
import 'package:flitter_9_start/service/shared_pref.dart' as pref;
import 'package:flitter_9_start/service/widget_support.dart';
import 'package:random_string/random_string.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
    const Signup({super.key});
  
    @override
    State<Signup> createState() => _SignupState();
  }
  
  class _SignupState extends State<Signup> {
  String email ='' , password = '', name = '';

  late String myText = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void registraion() async{
    email = emailController.text.trim();
    password = passwordController.text.trim();
    name = nameController.text.trim();
    if(nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty){
      try{
        UserCredential userCredential= await FirebaseAuth.
        instance.createUserWithEmailAndPassword(
            email: email, password: password);
        String userId = userCredential.user!.uid;
        print("User created with UID: $userId");
        String Id = randomAlphaNumeric(10);
        Map<String, dynamic> userInfoMap= {
          "Name":nameController.text,
          "Email":emailController.text,
          "Password":passwordController.text,
          "Id":Id,
          "Wallet":"0"
        };
        await pref.SharedpreferenceHelper.saveUserEmail(email);
        await pref.SharedpreferenceHelper.saveUserId(Id);
        await pref.SharedpreferenceHelper.saveUserName(nameController.text);
        await DatabaseMethods().addUserDetails(userInfoMap, Id);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.greenAccent,
            content: Text(' Successfully Registered ',style: TextStyle(fontSize: 18.0,color: Color.fromARGB(255, 0, 0, 0)),)
            ));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ButtomNav()));
      }on FirebaseAuthException catch(e){
        if(e.code=='weak-password'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text('The password provided is too weak',style: TextStyle(fontSize: 18.0),),
          ));
        }else if(e.code=='email-already-in-use'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text('The account already exists for that email',style: TextStyle(fontSize: 18.0),),
          ));ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text('The account already exists for that email',style: TextStyle(fontSize: 18.0),),
          ));
        }else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(' ${e.code}',style: TextStyle(fontSize: 18.0),),
          ));
        }
      }
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
                    height: MediaQuery.of(context).size.height/1.62,
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
                          Center(child: Text('Sign Up',style: AppWidget.HeadLineTextFeildStyle(),)),
                          SizedBox(height: 25.0,),
                      
                          Text('Name',style: AppWidget.SignUpTextFeildStyle(),),
                          SizedBox(height: 5.0,),
                          Container(
                            height: 40.0,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xFFececf8),
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: TextField(
                              controller: nameController
                            , decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your name',
                              hintStyle: AppWidget.SimpleTextFeildStyle(),
                              prefixIcon: Icon(Icons.person_2_outlined,color: Color(0xffef2b39),size: 30.0,),
                            ),),
                          ),
                          Text(myText,style: TextStyle(color: Colors.redAccent,fontSize: 18.0)),
                      
                          SizedBox(height: 10.0,),
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
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController
                            ,decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your email',
                              hintStyle: AppWidget.SimpleTextFeildStyle(),
                              prefixIcon: Icon(Icons.email_outlined,color: Color(0xffef2b39),size: 30.0,),
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
                              controller: passwordController
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
                                  setState(() {
                                  if(nameController.text.isNotEmpty && emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                                    name = nameController.text;
                                    email = emailController.text;
                                    password = passwordController.text;
                                    print('name $name email $email pass $password');
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      backgroundColor: Color(0xffef2b39),
                                      content: Text('Please fill all the fields',style: TextStyle(fontSize: 18.0),),
                                    ));
                                    myText = 'Please fill all the fields';
                                  }
                                  });
                                  registraion();

                                },
                                child: Text('Sign Up',style: AppWidget.boldwhiteTextFeildStyle(),),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Already have an account?',style: AppWidget.SignUpTextFeildStyle(),),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                  },
                                  child: Text('LogIn',style: AppWidget.LogInBtnTextFeildStyle(),),
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
  