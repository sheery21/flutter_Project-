

 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_5_start/brandNewPase.dart';
import 'package:flutter_5_start/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget{
   final String longinPage;
   homepage(this.longinPage);

   @override
   _homepageState createState() => _homepageState();
}
 class _homepageState extends State<homepage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('home',
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
        color: Colors.blue.shade200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home,color: Colors.white.withOpacity(0.7),size: 200,),
              SizedBox(height: 20,),

              ElevatedButton(onPressed: () async {
                var sharedPref = await SharedPreferences.getInstance();
                sharedPref.setBool(brandNewPaseState.KEYLOGIN, false);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginPage('login')));
      }, child: Text("Logout",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 4,

                ),
              ),
            ],
          ),

      ),
      ),
    );
  }

 }
