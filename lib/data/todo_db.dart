import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseCheck {
static DatabaseCheck? databaseCheck;
  static Database? _database;

  factory DatabaseCheck() {
    if (databaseCheck == null) {
      databaseCheck = DatabaseCheck._internal();
      return databaseCheck!;
    } else {
      return databaseCheck!;
    }
  }
  DatabaseCheck._internal();

  Future<Database> getDB() async {
    if (_database == null) {
      _database = await _initializeDatabase();
      return _database!;
    } else {
      return _database!;
    }
  }

  _initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "todo.db");
    var exists = await databaseExists(path);
    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data = await rootBundle.load(join("assets", "database.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      debugPrint("Opening existing database");
    }
    return await openDatabase(path, readOnly: false);
  }
}

