import 'package:flutter/material.dart';
import 'package:flutter_17_start/add_data.dart';
import 'package:flutter_17_start/list-map-provider.dart';
import 'package:provider/provider.dart';

class Listpage extends StatelessWidget {
  const Listpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Page')),
      body: Consumer<ListMapProvider>(
        builder: (context, value, child) {
          var allDat = value.getData();
          return allDat.isNotEmpty
              ? ListView.builder(
            itemCount: allDat.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(allDat[index]['name']?.toString() ?? 'No Name'),
                subtitle: Text(
                    allDat[index]['mobNe']?.toString() ?? 'No Number'),
                trailing: SizedBox(
                  width: 120,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<ListMapProvider>().updateData({
                            "name": "updated Name",
                            "mobNe": "09876876549876765432",
                          }, index);
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<ListMapProvider>().deleteData(index);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
              : Center(child: Text('No Contacts yet'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Add_Data()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
