import 'package:flutter/material.dart';
import 'package:flutter_12_start/widgets/uihelpar.dart';

import '../BottomNav/bottomNav.dart';

class Addpaymentmethods extends StatefulWidget {
  const Addpaymentmethods({super.key});

  @override
  State<Addpaymentmethods> createState() => _AddpaymentmethodsState();
}

class _AddpaymentmethodsState extends State<Addpaymentmethods> {
  TextEditingController CardholderName = TextEditingController();
  TextEditingController CardNumber = TextEditingController();
  TextEditingController ExpMonth = TextEditingController();
  TextEditingController ExpYear = TextEditingController();
  TextEditingController CVC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Payment Methods' , style: TextStyle(color: Color(0xFF333333), fontSize: 20, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
        resizeToAvoidBottomInset: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFF9FAFB),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 35.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(height: 20,),
              Text('Enter your payment details', style: TextStyle(color: Color(0xFF333333), fontSize: 16, fontWeight: FontWeight.bold),),
              Row(children: [
                Text('By continuing you agree to our', style: TextStyle(color: Color(0xFF333333), fontSize: 12, fontWeight: FontWeight.bold)),
                Text(' Terms', style: UiHelper.blueLinkTextFeildStyle()),
              ],),
                SizedBox(height: 30,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 111.67,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0xFFE5E7EB)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: UiHelper.CustomRadiusImage(imagePath: 'master_card.png', width: 111.67, height: 60.06, topLeft: 10, topRight: 10, bottomLeft: 10, bottomRight: 10, fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                                top: -10,
                                right: -10,
                                child:UiHelper.CustomImage(imagePath: 'Icon.png') )
                          ]
                      ),
                      Container(
                        width: 111.67,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFFE5E7EB)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: UiHelper.CustomRadiusImage(imagePath: 'Paypal.png', width: 111.67, height: 60.06, topLeft: 10, topRight: 10, bottomLeft: 10, bottomRight: 10, fit: BoxFit.cover),
                        ),
                      ),Container(
                        width: 111.67,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFFE5E7EB)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: UiHelper.CustomRadiusImage(imagePath: 'Applypay.png', width: 111.67, height: 60.06, topLeft: 10, topRight: 10, bottomLeft: 10, bottomRight: 10, fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('Cardholder name', style: UiHelper.ShortTextFeildStyle(),),
                  SizedBox(height: 5,),
                  UiHelper.CustomTextField(controller: CardholderName, text: "Jhon Henry", tohide: false)
                ],),
                SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('Cardholder name', style: UiHelper.ShortTextFeildStyle(),),
                  SizedBox(height: 5,),
                  UiHelper.CustomNumberField(controller: CardNumber, text: "**** **** **** 3947", tohide: false),
                ],),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('Cardholder name', style: UiHelper.ShortTextFeildStyle(),),
                      SizedBox(height: 5,),
                      UiHelper.CustomCalenderTextField(controller: ExpMonth, text: "12", tohide: false , maxLength: 2),
                    ],),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('Exp Year', style: UiHelper.ShortTextFeildStyle(),),
                      SizedBox(height: 5,),
                      UiHelper.CustomCalenderTextField(controller: ExpYear, text: "2025", tohide: false , maxLength: 4),
                    ],),
                  ],
                ),SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('Cardholder name', style: UiHelper.ShortTextFeildStyle(),),
                      SizedBox(height: 5,),
                      UiHelper.CustomCalenderTextField(controller: ExpMonth, text: "12", tohide: false , maxLength: 2),
                    ],),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('3 or 4 digits usually found ', style: UiHelper.ShortTextFeildStyle(),),
                        SizedBox(height: 5,),
                        Text('on the signature strip', style: UiHelper.ShortTextFeildStyle())
                      ],),
                    ),
                  ],),
                SizedBox(height: 35,),
                UiHelper.CustomButton(callback: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Bottomnav(startIndex: 0,)));
                }, buttonName: 'Add Now'),
            ],),
          ),
        ),
      ),
    );
  }
}
