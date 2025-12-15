import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DB_HElper {
  /// sigleton

  DB_HElper._();

  static final DB_HElper getInstance = DB_HElper._();

  /// table note

  static final String TABLE_NOTE = "note";
  static final String COLUMN_NOTE_SNO = "s_no";
  static final String COLUMN_NOTE_TITLE = "title";
  static final String COLUMN_NOTE_DESC = "description";

  Database? myDB;

  /// db Open (path -> if exits then open else create db)

  Future<Database> getDB() async {
    myDB ??= await openDB();
    return myDB!;

    // if (myDB != null) {
    //   return myDB!;
    // } else {
    //   myDB = await openDB();
    //   return myDB!;
    // }
  }

  Future<Database> openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();

    String dbPath = join(appDir.path, "noteDb.db");

    return await openDatabase(
      dbPath,
      onCreate: (db, version) async {
        /// create all your tables here

        await db.execute(
          "CREATE TABLE $TABLE_NOTE ($COLUMN_NOTE_SNO INTEGER PRIMARY KEY AUTOINCREMENT, $COLUMN_NOTE_TITLE TEXT, $COLUMN_NOTE_DESC TEXT)",
        );

        ///
        ///
        ///
        ///
        ///
      },
      version: 1,
    );
  }

  /// all queries
  /// insertion

  Future<bool> addNote({required String mTitle, required String mDesc}) async {
    var db = await getDB();
    int rowsEffected = await db.insert(TABLE_NOTE, {
      COLUMN_NOTE_TITLE: mTitle,
      COLUMN_NOTE_DESC: mDesc,
    });
    return rowsEffected > 0;
  }

  // Future<List<Map<String, dynamic>>> getAllNotes() async {
  //   var db = await getDB();
  //
  //   ///
  //   List<Map<String, dynamic>> mData = await db.query(
  //     TABLE_NOTE,
  //     columns: [COLUMN_NOTE_TITLE, COLUMN_NOTE_DESC],
  //   );
  //   return mData;
  // }

  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getDB();
    return await db.query(
      TABLE_NOTE,
      columns: [COLUMN_NOTE_SNO, COLUMN_NOTE_TITLE, COLUMN_NOTE_DESC],
    );
  }

  Future<bool> updateNote({
    required String mTitle,
    required String mDesc,
    required int mSno,
  }) async {
    var db = await getDB();

    int rowsEffected = await db.update(TABLE_NOTE, {
      COLUMN_NOTE_TITLE: mTitle,
      COLUMN_NOTE_DESC: mDesc,
    }, where: '$COLUMN_NOTE_SNO = $mSno');
    return rowsEffected > 0;
  }

  Future<bool> deleteNote({required int mSno}) async {
    var db = await getDB();

    int rowsEffected = await db.delete(
      TABLE_NOTE,
      where: '$COLUMN_NOTE_SNO = ?',
      whereArgs: ['$mSno'],
    );
    return rowsEffected > 0;
  }
}
