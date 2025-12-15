
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  Database? myDB;

  static final DBHelper getInstance = DBHelper._();

  static final String TABLE_NOTE = 'note';
  static final String COLUMN_NODE_SND = 's_no';
  static final String COLUMN_NODE_TITLE = 'title';
  static final String COLUMN_NODE_DESC = 'desc';

  Future <Database> getDB() async {
    myDB ??= await openDB();
    return myDB!;
  }

  Future<Database> openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, 'notDB.db');

    return await openDatabase(
        dbPath,
        onCreate: (db, version) async {
          print("Creating table $TABLE_NOTE...");
          await db.execute('''
          CREATE TABLE $TABLE_NOTE (
            $COLUMN_NODE_SND INTEGER PRIMARY KEY AUTOINCREMENT,
            $COLUMN_NODE_TITLE TEXT,
            $COLUMN_NODE_DESC TEXT
          )
        ''');
          print("Table created.");
        },
        version: 1
    );
  }

  Future<bool> addNote({
    required String mtitle,
    required String mdesc,
  }) async {
    var db = await getDB();
    int res = await db.insert(TABLE_NOTE, {
      COLUMN_NODE_TITLE: mtitle,
      COLUMN_NODE_DESC: mdesc,
    });
    return res > 0;
  }

  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getDB();
    return await db.query(
      TABLE_NOTE,
      columns: [
        COLUMN_NODE_SND,
        COLUMN_NODE_TITLE,
        COLUMN_NODE_DESC
      ],
    );
  }

  Future<bool> updateNote({
    required String mtitle,
    required String mdesc,
    required int sno
  }) async {
    var db = await getDB();
    int rows = await db.update(TABLE_NOTE, {
      COLUMN_NODE_TITLE: mtitle,
      COLUMN_NODE_DESC: mdesc,
    }, where: '$COLUMN_NODE_SND = $sno');

    return rows > 0;
  }

  Future<bool> deleteNote({required int sno }) async {
    var db = await getDB();
    int rows = await db.delete(
        TABLE_NOTE, where: '$COLUMN_NODE_SND = ?', whereArgs: ["$sno"]);
    return rows > 0;
  }
}