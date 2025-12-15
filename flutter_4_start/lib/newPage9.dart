

 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_4_start/newPage10.dart';

class newPage9 extends StatefulWidget {
      final String nameFromHome;
      newPage9(this.nameFromHome);
  @override
  _newPage9State createState() => _newPage9State();
}
class _newPage9State extends State<newPage9> with SingleTickerProviderStateMixin{

  late Animation _animation;
  late AnimationController _animationController;

  var listRadius = [150.0 , 200.0 ,250.0, 300.0, 350.0];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync:  this , duration: Duration(seconds: 5),lowerBound: 0.5);
    _animation = Tween(begin: 0.0 , end: 1.0).animate(_animationController);

    _animationController.addListener((){
      setState(() {});
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('hello newPage9'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: listRadius.map((radius) => Container(
                    height: radius*_animation.value,
                    width: radius*_animation.value,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.withOpacity(1.0 - _animation.value)
                    ),
                  )).toList(),
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>newPage10(widget.nameFromHome) ));
              }, child: Text("Click"),)
            ],
          ),
        ),
      ),
    );
  }

}