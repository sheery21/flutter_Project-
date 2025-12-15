import 'package:flitter_9_start/Admin/all_order.dart';
import 'package:flitter_9_start/Admin/manage_user.dart';
import 'package:flutter/material.dart';

import '../service/widget_support.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 65.0),
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Home Admin',style: AppWidget.HeadLineTextFeildStyle()),
              ],),
          ),
          SizedBox(height: 50.0),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xFFececf8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10.0,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> AllOrder()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0,),
                      child: Material(
                        elevation: 3.0,
                          borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                          padding: EdgeInsets.only( right: 20.0,left: 10.0,top: 10.0,bottom: 10.0),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30.0)),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Image.asset('images/deliverBoy.png',height: 120,width: 100,fit: BoxFit.cover,),
                              SizedBox(width: 10.0,),
                              Text('Manage \n Orders',style:TextStyle(color: Colors.black,fontSize: 26.0,fontWeight: FontWeight.bold),),
                              Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(color: Color( 0xffef2b39),borderRadius: BorderRadius.circular(10.0),),
                                  child: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 30.0)),
                            ],)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ManageUser()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0,),
                      child: Material(
                        elevation: 3.0,
                          borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                          padding: EdgeInsets.only( right: 20.0,left: 10.0,top: 10.0,bottom: 10.0),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30.0)),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Image.asset('images/peopleImg.png',height: 120,width: 100,fit: BoxFit.cover,),
                              SizedBox(width: 10.0,),
                              Text('Manage \n Users',style:TextStyle(color: Colors.black,fontSize: 26.0,fontWeight: FontWeight.bold),),
                              Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(color: Color( 0xffef2b39),borderRadius: BorderRadius.circular(10.0),),
                                  child: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 30.0)),
                            ],)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                ],
              ),
            ),
          ),
        ],),),
    );
  }
}