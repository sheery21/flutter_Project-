import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../service/database.dart';
import '../service/shared_pref.dart';
import '../service/widget_support.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  String? id;
  String? name;
  String? email;
  Stream? orderStream;

  getthesharedpref() async {
    id = await SharedpreferenceHelper.getUserId();
    name = await SharedpreferenceHelper.getUaesName();
    id = await SharedpreferenceHelper.getUserId();
    email = await SharedpreferenceHelper.getUserEmail();

    print('🔍 Shared Pref Data: name=$name, id=$id, email=$email');
    setState(() {
    });
  }
  getontheloed() async {
    await getthesharedpref();
    if (id != null && id!.isNotEmpty) {
      orderStream = await DatabaseMethods().getUserOder(id!);
      setState(() {});
    } else {
      print("⚠ User ID not found");
    }
    if (id == null) {
      print("⚠ User ID not found — can't fetch orders");
      return;
    }

    orderStream = await DatabaseMethods().getUserOder(id!);
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getontheloed();
  }

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
              margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Material(
                elevation: 3.0,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
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
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover)
                              : Image.asset(ds['foodImage'],
                              height: 120,
                              width: 120,
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
                              Text(
                                ds['status'].toString(),
                                style: const TextStyle(
                                  color: Color(0xffef2b39),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
        margin: const EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Orders', style: AppWidget.HeadLineTextFeildStyle()),
              ],
            ),
            const SizedBox(height: 10.0),
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
          ],
        ),
      ),
    );
  }




}
