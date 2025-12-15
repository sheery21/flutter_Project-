import 'package:flutter/material.dart';
import 'package:flutter_15_start/Pages/add_Data.dart';
import 'package:flutter_15_start/Pages/listMapProvider.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Page')),
      body: Consumer<ListMapProvider>(
        builder: (cont, value, child) {
          var allData = Provider.of<ListMapProvider>(context).getData();
          return allData.isNotEmpty
              ? ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${allData[index]['name']}'),
                      subtitle: Text('${allData[index]['mobNo']}'),
                      trailing: SizedBox(
                        width:0,
                        child: Row(
                          children: [
                            IconButton(onPressed: () {
                              context.read<ListMapProvider>().upDateData({
                                "name": "Updated Contact Name",
                                "mobNo": "9243243984",
                              }, index);
                            }, icon: Icon(Icons.edit ,color: Colors.greenAccent,)),
                            IconButton(onPressed: () {
                              context.read<ListMapProvider>().deletedData(index);
                            }, icon: Icon(Icons.delete,color: Colors.red,))
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(child: Text('No Contacts yet!!'));
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddData(),));
      }, child: Icon(Icons.add),),
    );
  }
}
