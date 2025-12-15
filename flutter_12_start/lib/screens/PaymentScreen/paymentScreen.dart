import 'package:flutter/material.dart';
import 'package:flutter_12_start/screens/Add%20Payment%20Methods/addPaymentMethods.dart';
import 'package:flutter_12_start/widgets/uihelpar.dart';

class Paymentscreen extends StatefulWidget {
  const Paymentscreen({super.key});

  @override
  State<Paymentscreen> createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text('Payment Methods' , style: TextStyle(color: Color(0xFF333333), fontSize: 20, fontWeight: FontWeight.bold),),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xFFF9FAFB),
        ),
        child: Column(children: [
          SizedBox(height: 200,),
          Column(children: [
            Text('No Payment Found', style: UiHelper.boldBlackTextFeildStyle(),),
            SizedBox(height: 10,),
            Text('You can add and edit payments during checkout', style: TextStyle(fontSize: 14, color: Color(0xFF333333), fontWeight: FontWeight.w400),),
          ],),
          SizedBox(height: 100,),
          Container(
            width: 335,
            height: 190,
            decoration: BoxDecoration(
              color: Color(0xFFDFEFFF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Addpaymentmethods()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                  width: 50,
                  height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Color(0xFF366190) , width: 3),
                    ),
                    child: Icon(Icons.add, color: Color(0xFF366190), size: 40,)),
                  SizedBox(height: 20,),
                  Text('Add Payment Method' , style: TextStyle(fontSize: 20, color: Color(0xFF366190), fontWeight: FontWeight.w400),),
              ],),
            ),
          )
        ],),
      ),
    );
  }
}
