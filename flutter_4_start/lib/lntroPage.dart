import 'package:flutter/material.dart';
import 'package:flutter_4_start/appPage.dart';
import 'package:flutter_4_start/main.dart';

class IntroPage extends StatefulWidget {
  final String nameFromHome;

  IntroPage(this.nameFromHome);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  var on1Controller = TextEditingController();
  var on2Controller = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello New IntroPage'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Colors.cyan,
          height: 800,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome ${widget.nameFromHome}',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => appPage(widget.nameFromHome),
                              ),
                            );
                          },
                          child: Text('Go To Home Page'),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Add The Numbers',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: on1Controller,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.deepPurple.shade200, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.deepPurple.shade200, width: 2),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: on2Controller, // ✅ Corrected controller
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.deepPurple.shade200, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.deepPurple.shade200, width: 2),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              var num1 = int.tryParse(on1Controller.text) ?? 0;
                              var num2 = int.tryParse(on2Controller.text) ?? 0;
                              var sum = num1 + num2;
                              setState(() {
                                result = 'The sum of $num1 and $num2 is $sum';
                              });
                            },
                            child: Text('Add'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              var num1 = int.tryParse(on1Controller.text) ?? 0;
                              var num2 = int.tryParse(on2Controller.text) ?? 0;
                              var sum = num1 - num2;
                              setState(() {
                                result = "The Difference between of $num1 and $num2 is $sum";
                              });
                            },
                            child: Text('Sub'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              var num1 = int.tryParse(on1Controller.text) ?? 0;
                              var num2 = int.tryParse(on2Controller.text) ?? 0;
                              var sum = num1 * num2;
                              setState(() {
                                result = "The Product of $num1 and $num2 is $sum";
                              });
                            },
                            child: Text('Mult'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              var num1 = int.tryParse(on1Controller.text) ?? 0;
                              var num2 = int.tryParse(on2Controller.text) ?? 0;
                              var sum = num1 / num2;
                              setState(() {
                                result = "The $num1 can be divided by $num2, $sum";
                              });
                            },
                            child: Text('Div'),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        result,
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
