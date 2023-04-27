import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:starbucks/common/const/database.dart';

class LcoalDatabase {
  Database? _database;

  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), kDatabaseName);
    return await openDatabase(
      path,
      version: kDatabaseVersion,
      onCreate: _onCreate,
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < newVersion) {
          db.rawQuery('drop table $kTableStarbucks');
          await _onCreate(db, newVersion);
        }
      },
    );
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE $kTableStarbucks (
        uuid TEXT PRIMARY KEY,
        name TEXT DEFAULT '', 
        major TEXT DEFAULT '',
        rate REAL DEFAULT 0,
        image TEXT DEFAULT '',
        description TEXT DEFAULT '' 
        )''');

  }
}
