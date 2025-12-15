import 'package:flutter/material.dart';
import 'package:flutter_17_start/list-map-provider.dart';
import 'package:provider/provider.dart';

class Add_Data extends StatelessWidget {
  const Add_Data({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Nots')),
      body: Center(
        child: IconButton(
          onPressed: () {
            context.read<ListMapProvider>().addData({
              "name": "Contacts Name",
              'mobNe': '9876576543',
            });
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
