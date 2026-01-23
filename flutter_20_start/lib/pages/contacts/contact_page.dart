import 'package:flutter/material.dart';
import 'package:flutter_20_start/widgets/ColorsField/colorsField.dart';
import 'package:flutter_20_start/widgets/customAppBarFIeld/customAppBarField.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsfield.customBlackColorField(),
      appBar: const Customappbarfield(
        title: "Contscts",
        actionType: AppBarActionType.contacts,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Center(child: Text("Message Page")),
            ),
          ),
        ],
      ),
    );
  }
}
