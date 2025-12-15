
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_8_start/model/model_User.dart';

class user_details extends StatefulWidget{
     final String name;
     final String email;
     final String phone;
     final String cell;
     final String picture;
     final String city;
     final String state;
     final String country;
     final String dob;
     user_details(this.name, this.email, this.phone, this.cell, this.picture , this.city, this.state, this.country, this.dob);
     @override
     _user_detailsState createState() => _user_detailsState();
}
class _user_detailsState extends State<user_details>{
  String? selectedFlag ;
  String? selectedCountry;

  @override
  void initState(){
    super.initState();

    selectedFlag = getFlagFromCountry(widget.country) ;
  }
  String getFlagFromCountry(String countryName) {
    final country = Country.tryParse(countryName);
    if (country != null) {
      return country.flagEmoji;
    }
    return '🏳️';
  }

  void showCountryPickerDialog() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        setState(() {
          selectedFlag = country.flagEmoji;
        });
      },
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(         
        title:  Center(child:  Text('User Details'),),
        backgroundColor: Colors.teal.shade200,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                 Center(
                   child: Container(
                    height: 150,
                    width: 350,
                    color: Colors.black,
                    child: Image.
                    network('https://images.ctfassets.net/hrltx12pl8hq/2RwJp3f9UiCnfWBEunwxOQ/'
                        'f11257994853124d7b1a6a935e678c13/0_hero.webp?fit=fill&w=400&h=100',
                      fit: BoxFit.fill,),),),
            Positioned(
              top: 50,
              left: 100,
              child: Container(
                child:
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(widget.picture),
                ),
              ),
            ),
               ]
              ),
            SizedBox(height: 120,),
            Container(
              child: Column(
                children: [
                  Text(widget.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                  SizedBox(height: 20,),
                  Container(
                  width: 350,
                  child: Text('Contacts',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
                  SizedBox(height: 20,),
                  Container(
                    width: 350,
                    child: Row(
                      children: [
                        Icon(Icons.email, color: Colors.teal.shade200,),
                        SizedBox(width: 10,),
                        Text(widget.email, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                  )
                  ,SizedBox(height: 20,),
                  Container(
                    width: 350,
                    child: Row(
                      children: [
                        Icon(Icons.phone, color: Colors.teal.shade200,),
                        SizedBox(width: 10,),
                        Text(widget.phone, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                     ]
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 350,
                    child: Row(
                      children: [
                        Icon(Icons.phone_android, color: Colors.teal.shade200,),
                        SizedBox(width: 10,),
                        Text(widget.cell, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 350,
                    child: Text('Address',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 350,
                    child: Row(
                      children: [
                        Text('${selectedFlag}',style: TextStyle( fontSize: 20),),
                        SizedBox(width: 10,),
                        Text( '${widget.country}', style: TextStyle( fontSize: 20 , fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 350,
                    child: Row(
                      children: [
                        Icon(Icons.location_city, color: Colors.teal.shade200,size: 25,),
                        SizedBox(width: 10,),
                        Text(widget.city, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}