import 'package:flutter/material.dart';
import 'package:flutter_15_start/Pages/listMapProvider.dart';
import 'package:provider/provider.dart';

class AddData extends StatelessWidget {
  const AddData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Note')),
      body: Center(
        child: IconButton(
          onPressed: () {
            context.read<ListMapProvider>().addData({
              "name": "Contact Name",
              "mobNo": "9242345454",
            });
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
