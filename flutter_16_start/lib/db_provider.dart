import 'package:flutter/cupertino.dart';
import 'package:flutter_16_start/local/DB_Helper.dart';

class DB_Provider extends ChangeNotifier {
  DB_HElper db_hElper;

  DB_Provider({required this.db_hElper});

  List<Map<String, dynamic>> _mData = [];

  void addNote(String title, String desc) async {
    bool check = await db_hElper.addNote(mTitle: title, mDesc: desc);
    if (check) {
      _mData = await db_hElper.getAllNotes();
      notifyListeners();
    }
  }

  void updateNote(String title, String desc, int sno) async {
    bool check = await db_hElper.updateNote(
      mTitle: title,
      mDesc: desc,
      mSno: sno,
    );
    if (check) {
      _mData = await db_hElper.getAllNotes();
      notifyListeners();
    }
  }

  void deleteNote(int sno) async {
    bool check = await db_hElper.deleteNote(mSno: sno);
    if (check) {
      _mData = await db_hElper.getAllNotes();
      notifyListeners();
    }
  }

  List<Map<String, dynamic>> getNotes() => _mData;

  void getInitialNotes() async {
    _mData = await db_hElper.getAllNotes();
    notifyListeners();
  }
}
