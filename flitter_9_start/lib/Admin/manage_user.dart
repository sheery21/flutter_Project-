import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flitter_9_start/service/database.dart';
import 'package:flutter/material.dart';

import '../service/widget_support.dart';

class ManageUser extends StatefulWidget {
  const ManageUser({super.key});

  @override
  State<ManageUser> createState() => _ManageUserState();
}


class _ManageUserState extends State<ManageUser> {

getontheload() async{

  userStream = await DatabaseMethods().getAllUser();
  setState(() {

  });

}

@override
  void initState() {
    super.initState();
    getontheload();
  }

Stream? userStream;
  Widget AllUser() {
    return StreamBuilder(
      stream: userStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            return Container(
              margin: EdgeInsets.only(left: 12.0,right: 12.0, bottom:20.0 ,),
              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(11.0),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15.0)), child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset('images/userPhoto.jpg',height: 90,width: 90,)),
                        SizedBox(width: 20.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Icon(Icons.person,color: Color(0xffef2b39),),
                              SizedBox(width: 10.0,),
                              Text(ds['Name'],style: AppWidget.boldTextFeildStyle(),),
                            ],),
                            Row(
                              children: [
                              Icon(Icons.email,color: Color(0xffef2b39),),
                              SizedBox(width: 10.0,),
                              Text(ds['Email'],style: AppWidget.SimpleTextFeildStyle(),),
                            ],),
                            SizedBox(height: 20.0,),
                            GestureDetector(
                              onTap: () async{
                                await DatabaseMethods().deleteUser(ds.id);
                              },
                              child: Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: Center(child: GestureDetector(child: Text("Remove",style: AppWidget.whiteTextFeildStyle(),))),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                ),
              ),
            );
          },
        ) : Container();
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all( 5),
                    decoration: BoxDecoration(
                        color: Color(0xffef2b39),borderRadius: BorderRadius.circular(30)
                    ),
                    child: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),),
                ),
                SizedBox(width: MediaQuery.of(context).size.width/6.5,),
                Text('Current User',style: AppWidget.HeadLineTextFeildStyle()),
              ],),
          ),
          SizedBox(height: 10.0),
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
                  Container(
                    height: MediaQuery.of(context).size.height/2,
                      child: AllUser()),
                  SizedBox(height: 20.0,),


                ],
              ),
            ),
          ),
        ],),),
    );
  }
}
