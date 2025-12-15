import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flitter_9_start/pages/buttomnav.dart';
import 'package:flitter_9_start/service/shared_pref.dart';
import 'package:random_string/random_string.dart';
import 'package:flitter_9_start/service/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../service/database.dart';

class DetailPage extends StatefulWidget {
  String image, name, price;
  DetailPage({required this.image,required this.name,required this.price});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  Map<String, dynamic>? paymentIntentData;
  String? name,id, email ,address , wallet;
  getthesharedpref() async{
    name = await SharedpreferenceHelper.getUaesName();
    id = await SharedpreferenceHelper.getUserId();
    email = await SharedpreferenceHelper.getUserEmail();
    address = await SharedpreferenceHelper.getUserAddress(id!);

    print('name $name id $id email $email');
    print('name $name id $id email $email');

    setState(() {});
  }
  TextEditingController addressController = TextEditingController();


  getUserWallet() async{
    await getthesharedpref();
    QuerySnapshot querySnapshot= await DatabaseMethods().getUserWalletbyemail(email!);
    wallet = "${querySnapshot.docs[0]['Wallet']}";
    print('wallet $wallet');
    setState(() {
    });
  }

  int quantity = 1, totalPrice= 0;

  final String secretKey= 'sk_test_51RtAqaBlNuo7DZBLca6tXmrhO5tmf5Z47XD6aofFPf3xl6bosk8DsPdtb0uIZiKOnpqluiM8Zaqj3Q2kSlDbeF4300oollo3ZC';

  @override
  void initState() {
    getUserWallet();
    super.initState();
    int basePrice = int.parse(widget.price.replaceAll(RegExp(r'[^\d]'), ''));
    totalPrice = basePrice * quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40.0,left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ButtomNav()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffef2b39),
                borderRadius: BorderRadius.circular(30.0),
              ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back,color: Colors.white, size: 30.0,),
            )),
          ),
          Center(child: Image.asset(widget.image,height: MediaQuery.of(context).size.height/3,fit: BoxFit.contain,)),
          SizedBox(height: 20.0,),
          Text(widget.name,style: AppWidget.HeadLineTextFeildStyle(),),
          Text(widget.price,style: AppWidget.SimpleTextFeildStyle(),),
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.only( right: 9.0),
            child: Text('Lorem ipsum dolor sit amet consectetur elit. enim omnis magnam, doloremque voluptate dolore.',style: AppWidget.priceTextFeildStyle(),),
          ),
          SizedBox(height: 20.0,),
          Text('Quantity',style: AppWidget.SimpleTextFeildStyle(),),
          SizedBox(height: 10.0,),
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                  quantity++;
                  int basePrice = int.parse(widget.price.replaceAll(RegExp(r'[^\d]'), ''));
                  totalPrice = quantity * basePrice;
                  });
                },
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                    color:  Color(0xffef2b39),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                    child: Icon(Icons.add,color: Colors.white,size: 30.0,),
                  ),
                ),
              ),
              SizedBox(width: 20.0,),
              Text(quantity.toString(),style: AppWidget.HeadLineTextFeildStyle(),),
              SizedBox(width: 20.0,),
              GestureDetector(
                onTap: (){
                  if(quantity>1){
                    quantity--;
                    totalPrice= quantity * int.parse(widget.price.replaceAll(RegExp(r'[^\d]'), ''));
                  }
                  setState(() {});
                },
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color:  Color(0xffef2b39),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(Icons.remove,color: Colors.white,size: 30.0,),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  height: 60,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text('Rs. $totalPrice',style: AppWidget.boldwhiteTextFeildStyle(),),
                  ),
                ),
              ),
              SizedBox(width: 20.0,),
              Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  height: 70,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () async{
                        if (address == null || address!.isEmpty) {
                          openBox();
                          print('address null');
                        } else if (int.parse(wallet!) > totalPrice) {
                          // makePayment(totalPrice.toString());
                          int updatedWallet = int.parse(wallet!) - totalPrice;
                          await DatabaseMethods().updateUserWallet(updatedWallet.toString(), id!);
                          String oderId = randomAlphaNumeric(10);
                          Map<String, dynamic> userOderMap ={
                            "Name": name,
                            "id": id,
                            "email": email,
                            "Quantity": quantity.toString(),
                            "TotalPrice": totalPrice.toString(),
                            'foodName': widget.name,
                            'foodImage': widget.image,
                            'foodPrice': widget.price,
                            'orderId': oderId,
                            'status': 'pending',
                            'address': address==null? addressController.text:address,
                          };
                          await DatabaseMethods().addUserOrderDetails(userOderMap, id!, oderId);
                          await DatabaseMethods().addAdminOrderDetails(userOderMap, oderId);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.greenAccent,
                              content: Text(' Order Placed Successfully',style: TextStyle(fontSize: 18.0,color: Color.fromARGB(255, 0, 0, 0)),)
                          ));
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Add some money to your wallet',style: TextStyle(fontSize: 18.0,color: Color.fromARGB(255, 0, 0, 0)),)
                          ));
                        }
                      },
                      child: Text('Order Now',style: AppWidget.whiteTextFeildStyle(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
        ),),
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
        String oderId = randomAlphaNumeric(10);
        Map<String, dynamic> userOderMap ={
          "Name": name,
           "id": id,
          "email": email,
          "Quantity": quantity.toString(),
          "TotalPrice": totalPrice.toString(),
          'foodName': widget.name,
          'foodImage': widget.image,
          'foodPrice': widget.price,
          'orderId': oderId,
          'status': 'pending',
          'address': address==null? addressController.text:address,
        };
        await DatabaseMethods().addUserOrderDetails(userOderMap, id!, oderId);
        await DatabaseMethods().addAdminOrderDetails(userOderMap, oderId);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.greenAccent,
            content: Text(' Order Placed Successfully',style: TextStyle(fontSize: 18.0,color: Color.fromARGB(255, 0, 0, 0)),)
        ));

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
        'Authorization': 'Bearer ${secretKey}',
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
                  Text('Add the Address',style: AppWidget.SimpleTextFeildStyle(),),
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
                  controller: addressController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Address',
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              GestureDetector(
                onTap: () async {
                  if (addressController.text.isNotEmpty) {
                    await SharedpreferenceHelper.saveUserAddress(id! ,addressController.text);
                    print('address saved: ${addressController.text}');
                      address = addressController.text;
                    setState(() {
                    });
                    Navigator.pop(context);

                    // Ab yahan direct payment call kar do
                    makePayment(totalPrice.toString());
                  }else {
                      ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text("Please enter an address")),);
                  }
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