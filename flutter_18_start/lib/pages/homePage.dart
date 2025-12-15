import 'package:flutter/material.dart';
import 'package:flutter_18_start/providers/homePageProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Home Page'))),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ChangeNotifierProvider<HomePgageProvider>(
            create: (context) => HomePgageProvider(),
            child: Consumer<HomePgageProvider>(
              builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(value.eligibiltyMessage.toString(),style: TextStyle(
                      color: (value.isEligibal== true ? Colors.green : Colors.red)
                    ),),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: "Enter your age"),
                      onChanged: (val){
                        value.checkEligibilty(int.parse(val));
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
