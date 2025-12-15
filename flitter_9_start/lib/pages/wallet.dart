import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flitter_9_start/service/constant.dart';
import 'package:flitter_9_start/service/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../service/shared_pref.dart';
import '../service/widget_support.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

  TextEditingController amountController = TextEditingController();

  Map<String, dynamic>? paymentIntentData;

    String? email, wallet, id;
    getthesharedpref() async{
      email = await SharedpreferenceHelper.getUserEmail();
      id = await SharedpreferenceHelper.getUserId();
      print('name $email');
      setState(() {});
    }
  getUserWallet() async{
    await getthesharedpref();
    walletStream = await DatabaseMethods().getUserTransaction(id!);
      await getthesharedpref();
    QuerySnapshot querySnapshot= await DatabaseMethods().getUserWalletbyemail(email!);
    wallet = "${querySnapshot.docs[0]['Wallet']}";
    print('wallet $wallet');
    setState(() {
    });
  }
  @override
  void initState() {
    super.initState();
    getUserWallet();
  }
  Stream? walletStream;

  Widget allTransactions() {
    return StreamBuilder(
      stream: walletStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];

            return Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(left: 20.0,right: 20.0 , bottom: 20.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFececf8),borderRadius: BorderRadius.circular(10.0),),
              child: Row(children: [
                Text(ds['date'], style: AppWidget.HeadLineTextFeildStyle(),),
                SizedBox(width: 20.0,),
                Column(children: [
                  Text("Amount added to wallet", style: AppWidget.SimpleTextFeildStyle(),),
                  Text("\Rs" +ds['amount'], style: TextStyle(color: Color(0xffef2b39),fontSize: 28.0, fontWeight: FontWeight.bold),),
                ],),
              ],
              ),
            );
          },
        ): Container();
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: wallet == null ? Center(child: CircularProgressIndicator()):  Container(
        margin: const EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Wallet', style: AppWidget.HeadLineTextFeildStyle()),
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
                child: Column(
                  children: [
                    SizedBox(height: 20.0,),
                    Container(
                      margin: EdgeInsets.only(left: 20.0,right: 20.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        elevation: 3.0,
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
                          child: Row(
                            children: [
                              Image.asset('images/wallet.png',height: 80.0 ,width: 80.0,fit: BoxFit.cover,),
                              SizedBox(width: 50.0,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Your Wallet', style: AppWidget.boldTextFeildStyle(),),
                                  Text('\Rs'+ wallet!, style: AppWidget.HeadLineTextFeildStyle(),),
                                  ],),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                             makePayment('50');
                    },
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black45,width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(child: Text('\$ 50', style: AppWidget.priceTextFeildStyle(),)),
                            ),
                          ),GestureDetector(
                            onTap: (){
                              makePayment('100');
                            },
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black45,width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(child: Text('\$ 100', style: AppWidget.priceTextFeildStyle(),)),
                            ),
                          ),GestureDetector(
                            onTap: (){
                              makePayment('200');
                            },
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black45,width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(child: Text('\$ 200', style: AppWidget.priceTextFeildStyle(),)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    GestureDetector(
                      onTap: (){
                        openBox();
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20.0,right: 20.0),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xffef2b39),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text('Add Money', style: AppWidget.boldwhiteTextFeildStyle(),
                                              ),
                        )
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0)),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 10.0,),
                            Text('Your Transations',style: AppWidget.boldTextFeildStyle(),),
                            SizedBox(height: 20.0,),
                            Container(
                                height:MediaQuery.of(context).size.height/2.5,
                                child: allTransactions())
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> makePayment(String amount) async{
    try {
      var paymentIntent = await createPaymentIntent(amount , 'USD');
      await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent?['client_secret'],style: ThemeMode.dark,
          merchantDisplayName: 'Admin')).then((value) {});
      displayPaymentSheet(amount);
    }catch(e,s){
      print('exception: $e$s');
    }
  }

  displayPaymentSheet(String amount) async{
    try{
      await Stripe.instance.presentPaymentSheet().then((value) async {
        int updatedWallet = int.parse(wallet!) + int.parse(amount);
        await DatabaseMethods().updateUserWallet(updatedWallet.toString(), id!);
        await getUserWallet();
        setState(() {});
        DateTime now = DateTime.now();
        String formattedDate = DateFormat("dd MMM").format(now);
        Map<String, dynamic> userTransactions = {
          "amount": amount,
          'date': formattedDate,
        };
        await DatabaseMethods().addUserTransaction(userTransactions, id!);
        showDialog(context: context, builder: (_) =>
            AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(Icons.check_circle,color: Colors.green,),
                      SizedBox(width: 10.0,),
                      Text('Payment Successfully'),
                    ],
                  )
                ],
              ),
            ));
      }).onError((error, stackTrace) {
        print('Error is:---> $error $stackTrace');
      });
    }on StripeException catch(e){
      print('Error is---> $e');
      showDialog(context: context, builder: (_) => AlertDialog( content: Text('Cancelled'),));
    }
  }

  createPaymentIntent(String amount, String currency) async{
    try{
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(Uri.parse('https://api.stripe.com/v1/payment_intents'),
          headers: {
            'Authorization': 'Bearer ${secretkey}',
            'Content-Type': 'application/x-www-form-urlencoded',

          },
          body: body);
      return jsonDecode(response.body);
    }catch(err){
      print('Error charging user is---> ${err.toString()}');
    }
  }
  calculateAmount(String amount){
    final calculatedAmount = (int.parse(amount)) * 100;
    return calculatedAmount.toString();
  }

  Future openBox()  => showDialog(context: context, builder: (context) => AlertDialog(
    content: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.cancel),),
                SizedBox(width: 30.0,),
                Text('Enter Amount',style: AppWidget.SimpleTextFeildStyle(),),
              ],
            ),
            SizedBox(height: 20.0,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                controller: amountController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Amount!!',
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            GestureDetector(
              onTap: () async {
                makePayment(amountController.text);
              },
              child: Center(
                child: Container(
                  width: 100,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text('Add',style: TextStyle(color: Colors.white,fontSize: 16.0,)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  ));

}
