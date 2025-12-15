import 'package:flutter/material.dart';
import 'package:flutter_16_start/db_provider.dart';
import 'package:flutter_16_start/local/DB_Helper.dart';
import 'package:provider/provider.dart';

class AddNotePage extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<Map<String, dynamic>> allNotes = [];
  String errorMsg = '';
  // DB_HElper? dbRef = DB_HElper.getInstance;
  bool isUpdate = false;
  String title;
  String desc;
  int sno;

  AddNotePage({this.isUpdate = false , this.title = '', this.desc = '', this.sno = 0});

  @override
  Widget build(BuildContext context) {

    if(isUpdate){
      titleController.text = title;
      descriptionController.text = desc;
    }


    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Add Note'))),
      body: Container(
        padding: EdgeInsets.all(11),
        width: double.infinity,
        child: Column(
          children: [
            // Text(
            //   isUpdate ? 'Update Note' : 'Add Note',
            //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: 21),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Enter title here',
                label: Text('Title *'),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
            ),
            SizedBox(height: 21),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Enter description here',
                label: Text('Description *'),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
            ),
            SizedBox(height: 21),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                        side: BorderSide(color: Colors.black, width: 4),
                      ),
                    ),
                    onPressed: () async {
                      var Title = titleController.text;
                      var Desc = descriptionController.text;

                      if (Title.isNotEmpty && Desc.isNotEmpty) {
                        if(isUpdate){
                          context.read<DB_Provider>().updateNote(Title, Desc, sno);
                          Navigator.pop(context);
                        }else{
                          context.read<DB_Provider>().addNote(Title, Desc);
                          Navigator.pop(context);
                        }
                      } else {
                        errorMsg = "*Please fill all the required fields";

                      }
                    },
                    child: Text(isUpdate ? 'Update Note' : 'Add Note'),
                  ),
                ),
                SizedBox(width: 11),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                        side: BorderSide(color: Colors.black, width: 4),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                ),
              ],
            ),

            if (errorMsg.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  errorMsg,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
