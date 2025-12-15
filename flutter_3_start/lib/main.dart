 import 'package:flutter/material.dart';
 import 'package:flutter_3_start/widgets/rounded_btn.dart';
 import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
       primarySwatch: Colors.blue,
           textTheme: TextTheme(
          headlineSmall: TextStyle(fontSize: 20,color: Colors.black,),
          headlineMedium: TextStyle(backgroundColor: Colors.deepPurple.shade200),
      ),
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

  var count = 0 ;
  var on1Controller =TextEditingController();
  var on2Controller =TextEditingController();
  var result = '';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.cyanAccent.shade400,

        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   height:100,
            //   color: Colors.red,
            //   child: Center(
            //     child: ElevatedButton(onPressed: (){
            //       print('Hello World');
            //     }, child: Text('Cleck me!!!')),
            //   ),
            // ),
            // SizedBox(height: 10,),
            // Column(
            //   children: [
            //     Container(
            //       width: 200,
            //       child: RoundedButton(btnName: 'login', icon: Icon(Icons.accessibility),callback: (){
            //              print('Logged in ???');
            //       },
            //         textStyle: TextStyle(color: Colors.orange,fontSize: 20,fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //     Container(
            //       width: 100,
            //       child: RoundedButton(btnName: 'login', icon: Icon(Icons.back_hand),callback: (){
            //              print('Logged in ???');
            //       },
            //         textStyle: TextStyle(color: Colors.orange,fontSize: 15,),
            //       ),
            //     ),
            //   ],
            // )
            // Container(
            //   width: double.infinity,
            //   height: double.infinity,
            //   child: Wrap(
            //     direction: Axis.vertical,
            //     alignment: WrapAlignment.spaceBetween,
            //     spacing: 11,
            //     runSpacing: 11,
            //     children: [
            //       Container(
            //           height: 100,
            //           width: 78.5,
            //           color: Colors.teal,
            //         ),
            //       Container(
            //           height: 100,
            //           width: 78.5,
            //           color: Colors.purple,
            //         ),
            //       Container(
            //           height: 100,
            //           width: 78.5,
            //           color: Colors.teal,
            //         ),
            //       Container(
            //           height: 100,
            //           width: 78.5,
            //           color: Colors.black,
            //         ),
            //       Container(
            //           height: 100,
            //           width: 78.5,
            //           color: Colors.teal,
            //         ),
            //       Container(
            //           height: 100,
            //           width: 78.5,
            //           color: Colors.purple,
            //         ),
            //       Container(
            //           height: 100,
            //           width: 78.5,
            //           color: Colors.teal,
            //         ),
            //
            //
            //
            //     ],
            //   ),
            // ),
            //    Wrap(
            //      direction: Axis.vertical,
            //      children: [
            //        SizedBox.square(
            //          dimension: 100,
            //          // width: 200,
            //          // height: 50,
            //          child:  ElevatedButton(
            //              onPressed: (){
            //                print('hello');
            //          },style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
            //          ),
            //              child: Text('hello',style: TextStyle(fontSize: 20),)),
            //        ),
            //        SizedBox(height: 10,),
            //        SizedBox.square(
            //          dimension: 100,
            //          // width: 200,
            //          // height: 50,
            //          child:  ElevatedButton(
            //              onPressed: (){
            //                print('hello');
            //          },style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
            //          ),
            //              child: Text('hello',style: TextStyle(fontSize: 20),)),
            //        ),
            //        SizedBox(height: 50,),
            //        SizedBox.square(
            //          dimension: 100,
            //          // width: 200,
            //          // height: 50,
            //          child:  ElevatedButton(
            //              onPressed: (){
            //                print('hello');
            //          },style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
            //          ),
            //              child: Text('hello',style: TextStyle(fontSize: 20),)),
            //        ),
            //
            //      ],
            //    )
            // Container(
            //   width: double.infinity,
            //   height: 150,
            //   color: Colors.teal.shade50,
            //   child: Center(
            //     child: RichText(text: TextSpan(
            //       style: TextStyle(
            //         color: Colors.blueGrey.shade800,
            //         fontSize: 20,
            //       ),
            //       children: [
            //         TextSpan(text: "hello",style: TextStyle(color: Colors.grey)),
            //         TextSpan(text: 'World! ',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold)),
            //         TextSpan(text: 'Welcome to '),
            //         TextSpan(text: 'Flutter ',style: TextStyle(color: Colors.red.shade800 ,fontSize: 35,fontWeight: FontWeight.bold,fontFamily:'FontMain'  )),
            //       ],
            //     )),
            //   ),
            // )
            // Container(height:600,width: double.infinity,
            //     child: Center(child: Row(
            //       children: [
            //         Icon(
            //           Icons.add_business_rounded,size: 100,color: Colors.purple.shade200,),
            //           Icon(FontAwesomeIcons.facebook,size: 75,color: Colors.blue.shade800,),
            //           Icon(FontAwesomeIcons.alignJustify,size: 70,color: Colors.green.shade500,),
            //           FaIcon(FontAwesomeIcons.amazon,size: 70,color: Colors.orange.shade800,)
            //       ],
            //     )))
            // Container(
            //   color: Colors.teal.shade50,
            //   width: 300,
            //   height: 300,
            //   child: Stack(
            //     children: [
            //       Positioned(
            //         bottom: 30,
            //         right: 100,
            //         child: Container(
            //           width: 100,
            //           height: 100,
            //           color: Colors.grey,
            //         ),
            //       )
            //       ],
            //   ),
            // )
            // Container(
            //   width: double.infinity,
            //   height: 500,
            //   color: Colors.teal.shade50,
            //   child: Center(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //
            //          RichText(
            //            text: TextSpan(
            //              style: TextStyle(
            //                color: Colors.blueGrey.shade800,
            //                fontSize: 20,
            //            ),
            //           children:[
            //             TextSpan(text: 'Count: ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
            //             TextSpan(text:'$count ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.grey),
            //         ),
            //     ]
            //         ),
            //         ),
            //         ElevatedButton(onPressed: (){
            //           setState(() {
            //           count++;
            //           });
            //         }, child: Text('Increment Count'))
            //       ],
            //     ),
            //   ),
            // )
              // Container(
              //   color: Colors.deepPurple.shade600,
              //   width: double.infinity,
              //   height: 800,
              //   child: Center(
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           TextField(
              //             keyboardType: TextInputType.number,
              //             style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
              //             decoration: InputDecoration(
              //               border: OutlineInputBorder(
              //                 borderRadius: BorderRadius.circular(12),
              //               ),
              //               focusedBorder: OutlineInputBorder(
              //                 borderRadius: BorderRadius.circular(12),
              //                 borderSide: BorderSide(color: Colors.deepPurple.shade200,width: 2),
              //               ),
              //             ),
              //             controller: on1Controller,
              //           ),
              //           TextField(
              //             keyboardType: TextInputType.number,
              //             style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
              //             decoration: InputDecoration(
              //               border: OutlineInputBorder(
              //                 borderRadius: BorderRadius.circular(12),
              //               ),
              //               focusedBorder: OutlineInputBorder(
              //                 borderRadius: BorderRadius.circular(12),
              //                 borderSide: BorderSide(color: Colors.deepPurple.shade200,width: 2),
              //               ),
              //             ),
              //             controller: on2Controller,
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //               children: [
              //                 ElevatedButton(onPressed: (){
              //                   var on1 = int.parse( on1Controller.text.toString());
              //                   var on2 = int.parse( on2Controller.text.toString());
              //                   var sum = on1+on2;
              //                   result = "The sum of $on1 and $on2 is $sum";
              //                   setState(() {});
              //                 }, child: Text('Add',style: TextStyle(fontSize: 15,color: Colors.black,)),style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple.shade200),),
              //
              //                 ElevatedButton(onPressed: (){
              //                   var on1 = int.parse( on1Controller.text.toString());
              //                   var on2 = int.parse( on2Controller.text.toString());
              //                   var diff = (on1 - on2).abs();
              //                   result = "The Difference between of $on1 and $on2 is $diff";
              //                   setState(() {});
              //                 }, child: Text('Sub',style: TextStyle(fontSize: 15,color: Colors.black,)),style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple.shade200)),
              //                 ElevatedButton(onPressed: (){
              //                   var on1 = int.parse( on1Controller.text.toString());
              //                   var on2 = int.parse( on2Controller.text.toString());
              //                   var product = on1 * on2;
              //                   result = "The Product of $on1 and $on2 is $product";
              //                   setState(() {});
              //                 }, child: Text('Mult',style: TextStyle(fontSize: 15,color: Colors.black,)),style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple.shade200)),
              //                 ElevatedButton(onPressed: (){
              //                   var on1 = int.parse( on1Controller.text.toString());
              //                   var on2 = int.parse( on2Controller.text.toString());
              //                   var times = on1 / on2;
              //                   result = "The $on1 can be divided by $on2, $times";
              //                   setState(() {});
              //                 }, child: Text('Div',style: TextStyle(fontSize: 15,color: Colors.black,)),style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple.shade200)),
              //               ],
              //             ),
              //           ),
              //           Padding(padding: EdgeInsets.all(21),
              //             child: Text(result,style: TextStyle(fontSize: 25,color: Colors.black),),),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            // Container(
            //   color: Colors.grey,
            //   width: double.infinity,
            //   height: double.infinity,
            //   child: Center(
            //     child: Column(
            //       children: [
            //         SizedBox(height: 200,),
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: TextField(
            //             controller: on1Controller,
            //             style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
            //               decoration: InputDecoration(
            //                   filled: true,
            //                   fillColor: Colors.grey.shade200,
            //                 border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(12),
            //                 ),
            //                 focusedBorder: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(12),
            //                   borderSide: BorderSide(color: Colors.deepPurple.shade200,width: 2),
            //                 )
            //               ),
            //           ),
            //         ),
            //         SizedBox(height: 10,),
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: TextField(
            //
            //             controller: on2Controller,
            //               style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                          // decoration: InputDecoration(
                          //     filled: true,
                          //     fillColor: Colors.grey.shade200,
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(12),
                          //     ),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(12),
                          //       borderSide: BorderSide(color: Colors.deepPurple.shade200,width: 2),
                          //     )
                          // ),
                      // ),
                    // ),
            //         SizedBox(height: 20,),
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               ElevatedButton(onPressed: (){
            //                 count ++;
            //                 var no1 = int.parse(on1Controller.text.toString());
            //                 var no2 = int.parse(on2Controller.text.toString());
            //                 var sum = no1 + no2 ;
            //                 result = "The sum of $no1 and $no2 is $sum";
            //                 setState(() {});
            //
            //               }, child: Text('Add',style: TextTheme.of(context).headlineSmall), style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple.shade200), ),
            //               ElevatedButton(onPressed: (){
            //
            //               }, child: Text('Sub',style: TextTheme.of(context).headlineSmall), style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple.shade200), ),
            //               ElevatedButton(onPressed: (){}, child: Text('Mult',style: TextTheme.of(context).headlineSmall), style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple.shade200), ),
            //               ElevatedButton(onPressed: (){}, child: Text('Div',style: TextTheme.of(context).headlineSmall), style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple.shade200), ),
            //            ],
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.all(21),
            //           child: Text('Result',style: TextTheme.of(context).headlineSmall,),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),






          ],
        ),
      ),
    );
  }
}
