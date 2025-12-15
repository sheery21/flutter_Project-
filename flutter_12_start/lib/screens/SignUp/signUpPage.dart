import 'package:flutter/material.dart';
import 'package:flutter_12_start/screens/BottomNav/bottomNav.dart';
import 'package:flutter_12_start/screens/Home/homePage.dart';
import 'package:flutter_12_start/screens/Login/loginPage.dart';

import '../../widgets/uihelpar.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityTownController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              UiHelper.CustomImage(
                imagePath: 'Capa_1.png',
                height: MediaQuery.of(context).size.height,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
               child: Padding(
                 padding: const EdgeInsets.only(left: 30.0 , right: 30),
                 child: Column(
                   children: [
                     SizedBox(height: 51),
                     Center(
                         child: UiHelper.CustomImage(
                           imagePath: "Group-59.png",
                           height: 115,
                           width: 115,
                         ),
                     ),
                     SizedBox(height: 19),
                     Center(
                       child: Text(
                         'Create your account!',
                         style: UiHelper.boldBlueTextFeildStyle(),
                       ),
                     ),
                     SizedBox(height: 20),
                     Center(
                       child: Text(
                         'Please enter detail carefully.',
                         style: UiHelper.blackTextFeildStyle(),
                       ),
                     ),
                     SizedBox(height: 25),
                     Center(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Name', style: UiHelper.LabelTextFeildStyle()),
                           UiHelper.CustomTextField(
                             controller: nameController,
                             text: 'e.g. Jhon Smith',
                             tohide: false,
                           ),
                         ],
                       ),
                     ),
                     SizedBox(height: 20),
                     Center(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Email', style: UiHelper.LabelTextFeildStyle()),
                           UiHelper.CustomTextField(
                             controller: emailController,
                             text: 'xyz@email.com',
                             tohide: false,
                           ),
                         ],
                       ),
                     ),
                     SizedBox(height: 20),
                     Center(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Contact Number', style: UiHelper.LabelTextFeildStyle()),
                           UiHelper.CustomNumberField(
                             controller: contactNumberController,
                             text: '+1 703-701-9964',
                             tohide: false,
                           ),
                         ],
                       ),
                     ),
                     SizedBox(height: 20),
                     Center(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Address', style: UiHelper.LabelTextFeildStyle()),
                           UiHelper.CustomTextField(
                             controller: addressController,
                             text: '2891 Sunridge Way NE',
                             tohide: false,
                           ),
                         ],
                       ),
                     ),
                     SizedBox(height: 20),
                     Center(
                       child: Container(
                         width: MediaQuery.of(context).size.width / 1.1,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   'City/Town',
                                   style: UiHelper.LabelTextFeildStyle(),
                                 ),
                                 UiHelper.CustomShortTextField(
                                   controller: cityTownController,
                                   text: 'e.g. Calgary',
                                   tohide: false,
                                 ),
                               ],
                             ),
                             SizedBox(width: 20),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   'e.g. T1Y 7K7',
                                   style: UiHelper.LabelTextFeildStyle(),
                                 ),
                                 UiHelper.CustomShortTextField(
                                   controller: postalCodeController,
                                   text: 'e.g. T1Y 7K7',
                                   tohide: false,
                                 ),
                               ],
                             ),
                           ],
                         ),
                       ),
                     ),
                     SizedBox(height: 20),
                     Center(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Password' ,style: UiHelper.LabelTextFeildStyle(),),
                           UiHelper.CustomTextField(
                             controller: passwordController,
                             text: '*********',
                             tohide: false,
                           ),
                         ],
                       ),
                     ),
                     SizedBox(height: 20),
                     Center(
                         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('Confirm Password' ,style: UiHelper.LabelTextFeildStyle(),),
                             UiHelper.CustomTextField(
                               controller: confirmPasswordController,
                               text: '*********',
                               tohide: true,
                             ),
                           ],
                         )
                     ),
                     SizedBox(height: 50,),
                     UiHelper.CustomButton(callback: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Bottomnav(startIndex: 0  ,)));
                     }, buttonName: 'Sign up'),
                     SizedBox(height: 30,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text('Already have an Account? ', style: UiHelper.blackTextFeildStyle(),),
                         GestureDetector(
                           onTap: (){
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                           },
                             child: Text('Login now.', style: UiHelper.blueTextFeildStyle(),)),
                       ],
                     ),
                     SizedBox(height: 40,),
                   ]
                 ),
               ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
