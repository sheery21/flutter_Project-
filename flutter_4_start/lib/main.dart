import 'package:flutter/material.dart';
import 'package:flutter_4_start/brandNewPase.dart';
import 'package:flutter_4_start/lntroPage.dart';
import 'package:flutter_4_start/newPage.dart';

void main() {
  runApp(const MyApp());
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
      home: brandNewPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({this.title ='' });
  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  
  

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   height: 800,
            //   width: double.infinity,
            //   child: Center(
            //   child: ConstrainedBox
            //     (constraints: BoxConstraints(
            //     maxWidth: 100,
            //     maxHeight: 100
            //   ),
            //       child: ConstrainedBox(
            //         constraints: BoxConstraints(
            //           maxWidth: 200,
            //           maxHeight: 300,
            //           minWidth: 100,
            //           // minHeight: 100,
            //         ),
            //         child: ElevatedButton(onPressed: (){
            //
            //         }, child: Text('Click'),
            //                       ),
            //       )
            //   )
            // ),
            // ),





          ],
        ),
      )

      
    );
  }
}
