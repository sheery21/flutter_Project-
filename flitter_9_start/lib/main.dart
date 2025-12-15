import 'package:firebase_core/firebase_core.dart';
import 'package:flitter_9_start/Admin/admin_login.dart';
import 'package:flitter_9_start/Admin/all_order.dart';
import 'package:flitter_9_start/Admin/home_admin.dart';
import 'package:flitter_9_start/Admin/manage_user.dart';
import 'package:flitter_9_start/pages/buttomnav.dart';
import 'package:flitter_9_start/pages/home.dart';
import 'package:flitter_9_start/pages/login.dart';
import 'package:flitter_9_start/service/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publishableKey;
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      home: ButtomNav(),
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
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(
        child: Text('hello'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}