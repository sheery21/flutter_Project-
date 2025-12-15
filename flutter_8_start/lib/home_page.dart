
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_8_start/model/model_User.dart';
import 'package:flutter_8_start/userDetails/user_details.dart';
import 'package:http/http.dart' as http;

class home_page extends StatefulWidget{
     final String homepage;
     home_page(this.homepage);
     @override
     _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page>{

  List<User> users =[];
  Set<String> clickedUsers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Text('Rest API Call'),
        centerTitle: true,

      ),
        floatingActionButton: FloatingActionButton(
            onPressed: fetchUsers,
            child: Icon(Icons.refresh),
            splashColor: Colors.grey.shade200,
            backgroundColor: Colors.grey
        ),
      floatingActionButtonLocation:FloatingActionButtonLocation.endFloat,

      body: SingleChildScrollView(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  SizedBox(
                    height: 800,
                    child: ListView.builder(
                      itemCount: users.length,
                      // physics:  NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                      final user = users[index];
                        final email = user.email;
                        final name = user.name;
                      return ListTile(
                        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                        subtitle: Text(email, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.picture),
                        ),
                        trailing: IconButton(
                            onPressed: (){
                              setState(() {
                                clickedUsers.add(email);
                              });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => user_details(
                                user.name,
                                user.email,
                                user.phone,
                                user.cell,
                                user.picture,
                                user.city,
                                user.state,
                                user.country,
                                user.dob,
                              ),
                            ),
                          );
                        }, icon: Icon(Icons.info_outline , color: clickedUsers.contains(email) ? Colors.green : Colors.red,)),

                      );
                    },),
                  ),

               SizedBox(height: 50,),
            ]
            ),
          ),
        ),
      ),
    );
  }

  void fetchUsers() async {

    try{
    const url = 'https://randomuser.me/api/?results=200';
    final uri = Uri.parse(url);
    final response = await  http.get(uri);
    final data = response.body;
    final parsed = jsonDecode(data);
    final results = parsed['results'] as List<dynamic>;
    final transFormed = results.map((e) => User(
        gender: e['gender'],
        name: e['name']['first'],
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        picture: e['picture']['medium'],
        city: e['location']['city'],
        state: e['location']['state'],
        country: e['location']['country'],
        dob: e['dob']['date'],
    )).toList();

    setState(() {
      users = transFormed;
    print('results: $results');
    });

    }catch (e){
      print('Error: $e.message');
    }
    print('fetchUser complted');
  }
}

