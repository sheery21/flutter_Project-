// import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:flutter_21_start/counter_controller.dart';
import 'package:flutter_21_start/screen_one.dart';
// import 'package:get/route_manager.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CounterController controller = Get.put(CounterController());
  double opacity = .4;
  bool notification = false;
  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      appBar: AppBar(title: Text("GetX")),
      body: Container(
        child: Column(
          children: [
            // Card(
            //   child: ListTile(
            //     title: Text("GetX Bottom Sheet"),
            //     subtitle: Text("GetX dialog alert twith"),
            //     onTap: () {
            //       Get.bottomSheet(
            //         Container(
            //           height: 200,
            //           padding: EdgeInsets.all(10),
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.vertical(
            //               top: Radius.circular(20),
            //             ),
            //           ),
            //           child: Column(
            //             children: [
            //               ListTile(
            //                 leading: Icon(Icons.light_mode),
            //                 title: Text("Light Theme"),
            //                 onTap: () {
            //                   print("Light clicked");
            //                   Get.changeTheme(ThemeData.light());
            //                 },
            //               ),
            //               ListTile(
            //                 leading: Icon(Icons.dark_mode),
            //                 title: Text("Dark Theme"),
            //                 onTap: () {
            //                   print("Dark clicked");
            //                   Get.changeTheme(ThemeData.dark());
            //                 },
            //               ),
            //             ],
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),

            // Center(
            //   child: TextButton(
            //     onPressed: () {
            //       // Get.to(ScreenOne(name: "sherry"));
            //       Get.toNamed(
            //         "/screen_One",
            //         arguments: ["serrry", "My name is this"],
            //       );
            //     },
            //     child: Text("Go to next screen"),
            //   ),
            // ),
            // ListTile(title: Text("message".tr), subtitle: Text("name".tr)),
            // Center(
            //   child: Obx(() {
            //     return Text(controller.counter.toString());
            //   }),
            // ),
            Column(
              children: [
                Obx(
                  () => Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(controller.opacity.value),
                    ),
                  ),
                ),
                Obx(
                  () => Slider(
                    value: controller.opacity.value,
                    onChanged: (Value) {
                      print("value $Value");
                      opacity = Value;
                      controller.setOpacity(Value);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Notification"),
                    Switch(
                      value: controller.notification.value,
                      onChanged: (Value) {
                        notification = Value;
                        print("notification $notification");
                        controller.notifyLisner(Value);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.snackbar(
          //   "Sherry",
          //   "Subscribe to my channel",
          //   icon: Icon(Icons.add),
          //   onTap: (snack) {},
          //   mainButton: TextButton(onPressed: () {}, child: Text("Click me")),
          //   backgroundColor: Colors.blueAccent,
          //   snackPosition: SnackPosition.TOP,
          // );
          controller.incrementCounter();
        },
      ),
    );
  }
}
