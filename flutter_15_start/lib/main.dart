import 'package:flutter/material.dart';
import 'package:flutter_15_start/Pages/add_Data.dart';
import 'package:flutter_15_start/Pages/counter_provider.dart';
import 'package:flutter_15_start/Pages/home.dart';
import 'package:flutter_15_start/Pages/listMapProvider.dart';
import 'package:flutter_15_start/Pages/list_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListMapProvider(),),
        ChangeNotifierProvider(create: (context) => CounterProvider(),)
      ],
      child:MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ListPage(),
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
      body: Center(
      child: Text(''),
      )
    );
  }
}