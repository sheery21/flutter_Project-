import 'package:flutter/material.dart';
import 'package:flutter_16_start/db_provider.dart';
import 'package:flutter_16_start/local/DB_Helper.dart';
import 'package:flutter_16_start/local/add_note_page.dart';
import 'package:provider/provider.dart';

class Hone_Page extends StatefulWidget {
  const Hone_Page({super.key});

  @override
  State<Hone_Page> createState() => _Hone_PageState();
}

class _Hone_PageState extends State<Hone_Page> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  @override
  void initState() {
    super.initState();
    context.read<DB_Provider>().getInitialNotes();

  }


  @override
  Widget build(BuildContext context) {
    // var db = await getDB()
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Notes',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),

      ///all notes viewed here
      body:Consumer<DB_Provider>(builder: (context, value, child) {
        List<Map<String , dynamic>> allNotes = value.getNotes();
        return  allNotes.isNotEmpty
            ? ListView.builder(
          itemCount: allNotes.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(
                allNotes[index][DB_HElper.COLUMN_NOTE_SNO].toString(),
              ),
              title: Text(
                allNotes[index][DB_HElper.COLUMN_NOTE_TITLE],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                allNotes[index][DB_HElper.COLUMN_NOTE_DESC],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: SizedBox(
                width: 60,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddNotePage(
                              isUpdate: true,
                              title:
                              allNotes[index][DB_HElper
                                  .COLUMN_NOTE_TITLE],
                              desc:
                              allNotes[index][DB_HElper
                                  .COLUMN_NOTE_DESC],
                              sno:
                              allNotes[index][DB_HElper
                                  .COLUMN_NOTE_SNO],
                            ),
                          ),
                        );
                      },
                      child: Icon(Icons.edit, color: Colors.blue),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () async {
                        context.read<DB_Provider>().deleteNote(
                          allNotes[index][DB_HElper.COLUMN_NOTE_SNO]
                        );
                      },
                      child: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ),
            );
          },
        )
            : Center(child: Text('No Notes yet!!'));
      },),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          /// Note to be added from here
          String errorMsg = '';

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNotePage()),
          );

        },
        child: Icon(Icons.add),
      ),
    );
  }
}
