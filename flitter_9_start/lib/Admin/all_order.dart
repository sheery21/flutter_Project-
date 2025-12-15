
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flitter_9_start/service/database.dart';
import 'package:flitter_9_start/service/widget_support.dart';
import 'package:flutter/material.dart';

class AllOrder extends StatefulWidget {
  const AllOrder({super.key});

  @override
  State<AllOrder> createState() => _AllOrderState();
}

class _AllOrderState extends State<AllOrder> {

  getontheload() async {
    orderStream = await DatabaseMethods().getAdminOder();
    setState(() {

    });
  }
  @override
  void initState() {
    super.initState();
    getontheload();
  }




  Stream? orderStream;

  Widget allOrders() {
    return StreamBuilder(
      stream: orderStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: Material(
                elevation: 3.0,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_on_outlined,
                              color: Color(0xffef2b39)),
                          const SizedBox(width: 10.0),
                          Text(ds['address'],
                              style: AppWidget.SimpleTextFeildStyle()),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          // Agar image URL hai to Image.network use karein
                          ds['foodImage'].toString().startsWith("http")
                              ? Image.network(ds['foodImage'],
                              height: 110,
                              width: 110,
                              fit: BoxFit.cover)
                              : Image.asset(ds['foodImage'],
                              height: 110,
                              width: 110,
                              fit: BoxFit.cover),
                          const SizedBox(width: 20.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(ds['foodName'],
                                  style: AppWidget.boldTextFeildStyle()),
                              const SizedBox(height: 5.0),
                              Row(
                                children: [
                                  const Icon(Icons.format_list_numbered,
                                      color: Color(0xffef2b39)),
                                  const SizedBox(width: 10.0),
                                  Text(ds['Quantity'].toString(),
                                      style: AppWidget.boldTextFeildStyle()),
                                  const SizedBox(width: 10.0),
                                  const Icon(Icons.monetization_on,
                                      color: Color(0xffef2b39)),
                                  const SizedBox(width: 10.0),
                                  Text("${ds['foodPrice']}",
                                      style: AppWidget.boldTextFeildStyle()),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                children: [
                                Icon(Icons.person,color: Color(0xffef2b39),),
                                SizedBox(width: 10.0,),
                                Text( ds['Name'] ,style: AppWidget.SimpleTextFeildStyle(),)
                              ],),
                              const SizedBox(height: 5.0),
                              Row(children: [
                                Icon(Icons.email,color: Color(0xffef2b39),),
                                SizedBox(width: 10.0,),
                                Text( ds['email'] ,style: AppWidget.SimpleTextFeildStyle(),)
                              ],),
                              const SizedBox(height: 5.0),
                              Text(
                                ds['status']+ "!".toString(),
                                style: const TextStyle(
                                  color: Color(0xffef2b39),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              GestureDetector(
                                onTap: () async {
                                  await DatabaseMethods().updateAdminOrder(ds.id);
                                  await DatabaseMethods().updateUserOrder(ds['id'], ds.id);
                                  print("Admin Order ID: ${ds.id}");
                                },
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                                  child: Center(child: Text('Delivered',style: AppWidget.whiteTextFeildStyle())),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ): Container();
      },
  );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),borderRadius: BorderRadius.circular(30)
                  ),
                  child: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),),
              ),
              SizedBox(width: MediaQuery.of(context).size.width/5,),
              Text('All Order',style: AppWidget.HeadLineTextFeildStyle()),
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
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: allOrders(),
              ),
            ),
          ),
        ],),),
    );
  }
}
