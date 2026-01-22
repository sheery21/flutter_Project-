import 'package:flutter/material.dart';
import 'package:flutter_20_start/widgets/ColorsField/colorsField.dart';
import 'package:flutter_20_start/widgets/customAppBarFIeld/customAppBarField.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsfield.customBlackColorField(),
      appBar: const Customappbarfield(
        title: "Calls",
        actionType: AppBarActionType.call,
      ),
      body: Center(
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
    );
  }
}
