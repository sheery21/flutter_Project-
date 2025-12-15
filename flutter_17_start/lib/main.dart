import 'package:flutter/material.dart';
import 'package:flutter_17_start/ListPage.dart';
import 'package:flutter_17_start/counter_provider.dart';
import 'package:flutter_17_start/list-map-provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => ListMapProvider()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Listpage()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    print('Consummer build function called!!');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context, value, child) {
            print('Consummer Consumer function called!!');
            return Text(
              // '${Provider.of<CounterProvider>(context , listen: true).geCount()}'
              '${context.watch<CounterProvider>().geCount()}',
              style: TextStyle(fontSize: 25),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              print('Consummer floatingActionButton function called!!');
              // Provider.of<CounterProvider>(context , listen: false).incrementCount();
              context.read<CounterProvider>().decrementCount();
            },
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Listpage(),));
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
