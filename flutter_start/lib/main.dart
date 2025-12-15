import 'package:flutter/material.dart';
import 'package:flutter_start/ui_helper/ui_lib.dart';
import 'package:intl/intl.dart';

void main() {
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
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        textTheme: TextTheme(
          titleSmall: TextStyle(
            fontFamily: 'FontMain',
            fontWeight: FontWeight.w500,
            fontSize: 11,
            color: Colors.lightGreenAccent,
          ),
        ),
      ),
      home: MyHomePage(title: 'My App Title'),
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
  var emailText = TextEditingController();
  var passText = TextEditingController();
  var arrOfColor = [Colors.lightGreen,
    Colors.white,
    Colors.blue,
    Colors.black,
    Colors.teal,
    Colors.lime,
    Colors.indigo,
    Colors.amber,
    Colors.white70,];
  
  callBack(){
    print('Clicked!!!!!!!!!!!!!!!!!!');
  }
  var arrName = ['Ali', 'Zara', 'Ahmed', 'Usman', 'Fatima', 'Hassan', 'Ayesha', 'Bilal', 'Sara', 'Kashif',];
  var arrNumber = ['One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten'];

  @override
  Widget build(BuildContext context) {

    var time = DateTime.now();
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Container')),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.purpleAccent, width: 10),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Column(
                children: [
                  CatItem(),
                  SizedBox(height: 10,),
                  World(arrName: arrName, arrNumber: arrNumber),
                  SizedBox(height: 10,),
                  HelloItem(),
                  SizedBox(height: 10,),
                  helloWord()
                ],
              ),
            ),
            SizedBox(height: 10),

            ElevatedButton(onPressed: (){
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.cyan)),
              child:  Text('sherry',style:  TextStyle(color: Colors.orange,),
            ),),
            SizedBox(height: 10),













            SizedBox(height: 10),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.purpleAccent, width: 10),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CatItem extends StatelessWidget{
  const CatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Container(
       height: 200,
       color: Colors.orange,
       child: ListView.builder(itemBuilder: (context, index) {
      return Padding(
       padding: const EdgeInsets.all(8.0),
        child: SizedBox(
        width: 100,
        child: CircleAvatar(
        backgroundColor: Colors.teal,
        ),
        ),
        );
        }, itemCount: 10, scrollDirection: Axis.horizontal,),
        );
  }}
class HelloItem extends StatelessWidget{
  const HelloItem({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 200,
        color: Colors.orange,
        child:  GridView.count( crossAxisCount: 4,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      );
  }

}
class World extends StatelessWidget{
    final List<String> arrName;
    final List<String> arrNumber;

    const World({
      Key? key,
      required this.arrName,
      required this.arrNumber,
    }) :super (key: key);
  Widget build(BuildContext context) {
    var arrName = ['Ali', 'Zara', 'Ahmed', 'Usman', 'Fatima', 'Hassan', 'Ayesha', 'Bilal', 'Sara', 'Kashif',];
    var arrNumber = ['One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten'];
    return
      Container(
        height: 300,
        color: Colors.orange,
        child: ListView.builder(itemBuilder: (context, index) {
          return ListTile(
            leading:Image.network('https://images.unsplash.com/photo-1633332755192-727a05c4013d?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D',),
            title: Text(arrName[index]),
            subtitle: Text('Number ${arrName[index]}'),
            trailing: Icon(Icons.import_contacts_sharp),
          );
        }, itemCount: arrNumber.length),
      );
  }
}
class helloWord extends StatelessWidget {
  const helloWord({super.key});

  @override
  Widget build (BuildContext context) {
    return  Container(
      height: 200,
      color: Colors.orange,
      child: ListView.builder(itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 100,
            child: CircleAvatar(
              backgroundColor: Colors.teal,
              child: Text('hello world',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontFamily:'FontMain' ,
                ),
              ),
            ),
          ),
        );
      }, itemCount: 10, scrollDirection: Axis.horizontal,),
    );


}
}
