

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget{
  final String btnName;
  final Icon? icon;
  final Color? bgColor;
  final TextStyle? textStyle;
  final VoidCallback? callback;
  const RoundedButton({super.key,  required this.btnName ,
    this.icon,
    this.bgColor = Colors.amber,
    this.textStyle,
    this.callback});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          callback!();
        },
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shadowColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(21),
            bottomLeft: Radius.circular(21),
          ),
        )
      ), child: icon!=null ? Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon!,
        SizedBox(width: 10),
        Text(btnName,style: textStyle ?? TextStyle(color: Colors.orange,),),
      ],

    ):Text(btnName,style: textStyle ??TextStyle(color: Colors.white),)
    );
  }
}
