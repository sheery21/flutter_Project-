import 'package:donation_drive/widgets/TextStyleField/headingField.dart';
import 'package:donation_drive/widgets/TextStyleField/textField.dart';
import 'package:flutter/material.dart';

class Tokendetails extends StatelessWidget {
  const Tokendetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFF8F9FA)),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Token Details" ,style: TextStyleField.Heading_1(),),
            SizedBox(height: 20),
            Text("Complete breakdown of all tokens" ,style: ShortTextField.mainShortText_2(),),


          ],
        ),
      ),
    );
  }
}
