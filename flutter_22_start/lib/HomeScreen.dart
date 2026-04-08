import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    TextEditingController nameController = TextEditingController();
    static const String KEYNAME = "name";
    var nameValue = "No value Saved";

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomeScreen")),
      body: Container(
        width: double.infinity,
        height: double.infinity,

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 50,
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "Enter Your Name",
                    label: Text("Name"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed:  () async{
                  String name = nameController.text;
                  print(name);
                  final prefs =  await SharedPreferences.getInstance();

                  prefs.setString(KEYNAME, name);
                  setState(() {});
                },
                child: Text("Submit", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 20),
              Text(nameValue),
            ],
          ),
        ),
      ),
    );
  }

  void getValue() async  {
      final prefs =  await SharedPreferences.getInstance();
     final getName =  prefs.getString(KEYNAME);
     nameValue = getName ??"No value Saved";
     setState(() {});
  }
}
