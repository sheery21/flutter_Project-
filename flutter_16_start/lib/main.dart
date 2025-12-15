import 'package:flutter/material.dart';
import 'package:flutter_16_start/db_provider.dart';
import 'package:flutter_16_start/home_page.dart';
import 'package:flutter_16_start/local/DB_Helper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => DB_Provider(db_hElper: DB_HElper.getInstance),
    child: MyApp(),
  ));

  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Hone_Page(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

     DB_HElper db = DB_HElper.getInstance;

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.orange,
          height: 500,
          width: 400,
          child: Center(child: Text('hello', style: TextStyle(color: Colors.white , fontSize: 60),)),
        ),
      ),
    );
  }
}
