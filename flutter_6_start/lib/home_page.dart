import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_6_start/data/local/db_helper.dart';

class Home_page extends StatefulWidget {
  final String userName;
  Home_page(this.userName);

  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  List<Map<String, dynamic>> allNotes = [];
  DBHelper? dbRef;

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  var error = '';
  @override
  void initState() {
    super.initState();
    dbRef = DBHelper.getInstance;
    getNotes();
  }
  void getNotes() async {
    allNotes = await dbRef!.getAllNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        children: [
          Expanded(
            child: allNotes.isNotEmpty
                ? ListView.builder(
              itemCount: allNotes.length,
              itemBuilder: (_, index) {
                return ListTile(
                  leading: Text(allNotes[index][DBHelper.COLUMN_NODE_SND].toString(),),
                  title: Text(allNotes[index][DBHelper.COLUMN_NODE_TITLE]),
                  subtitle: Text(allNotes[index][DBHelper.COLUMN_NODE_DESC]),
                  trailing: SizedBox(
                    width: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            showModalBottomSheet(
                              context: context, builder: (context) {
                                titleController.text = allNotes[index][DBHelper.COLUMN_NODE_TITLE];
                                descController.text = allNotes[index][DBHelper.COLUMN_NODE_DESC];
                              return BottomSheetView(
                                  dbRef: dbRef!,
                                  onNoteAdded: () => getNotes(),
                              isUpdate: true,
                              title: allNotes[index][DBHelper.COLUMN_NODE_TITLE],
                              desc: allNotes[index][DBHelper.COLUMN_NODE_DESC],
                              sno: allNotes[index][DBHelper.COLUMN_NODE_SND],);
                            },);
                  },
                            child: Icon(Icons.edit , color: Colors.blue,)),
                        InkWell(
                          onTap: (){
                            dbRef!.deleteNote(sno: allNotes[index][DBHelper.COLUMN_NODE_SND]);
                            getNotes();
                          },
                            child: Icon(Icons.delete , color: Colors.red,)),
                      ],
                    ),
                  ),
                );
              },
            )
                : Center(
              child: Text("No Notes"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showModalBottomSheet(
              context: context, builder: (context) {
                return BottomSheetView(dbRef: dbRef!,onNoteAdded: (){getNotes();});
          },);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class BottomSheetView extends StatefulWidget{
  final DBHelper dbRef;
  final VoidCallback onNoteAdded;
  final bool isUpdate;
  final String? title;
  final String? desc;
  final int? sno;

  BottomSheetView({required this.dbRef, required this.onNoteAdded ,this.isUpdate = false, this.title, this.desc, this.sno });

  @override
  State<StatefulWidget> createState() => _BottomSheetViewState();

}

class _BottomSheetViewState extends State<BottomSheetView> {
  late  TextEditingController titleController ;
  late TextEditingController descController;
  var error = '';


  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title ?? '');
    descController = TextEditingController(text: widget.desc ?? '');
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      padding: EdgeInsets.all(15),
      width: double.infinity,
      child: Column(
        children: [
          Text( widget.isUpdate ? 'Update Note' : 'Add Note',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          SizedBox(height: 21,),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.black87),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText:  'Title',
            ),
          ),
          SizedBox(height: 21,),
          TextField(
            controller: descController,
            maxLines: 5,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.black87),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: 'Description',
            ),
          ),
          SizedBox(height: 21,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: ElevatedButton(
                  onPressed: () async {
                    var title = titleController.text;
                    var desc = descController.text;
                    if (title.isNotEmpty && desc.isNotEmpty) {
                      bool check = widget.isUpdate ?
                          await widget.dbRef!.updateNote(
                              mtitle: title,
                              mdesc: desc,
                              sno: widget.sno!,)
                          :await widget.dbRef!.addNote(mtitle: title, mdesc: desc);
                      if (check) {
                        widget.onNoteAdded();
                        Navigator.pop(context);
                      } else {
                        setState(() {
                          error = 'Failed to add note';
                        });
                      }
                    } else {
                      setState(() {
                        error = 'Please fill all fields';
                      });
                    }
                    titleController.clear();
                    descController.clear();
                  }, child: Text( widget.isUpdate ? 'Update' : 'Add',
                  style: TextStyle(fontSize: 18),),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: ElevatedButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Text('Cancel',
                  style: TextStyle(fontSize: 18),
                ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Text(error, style: TextStyle(fontSize: 18, color: Colors.red),),
        ],
      ),
    );
  }

}
