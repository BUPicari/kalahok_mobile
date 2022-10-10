import 'dart:developer';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalahok_mobile/src/blocs/database/database.state.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseBloc extends Cubit<DatabaseState> {
  DatabaseBloc() : super(InitDatabaseState());

  Database? database;

  Future<void> initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'kalahok1.db');
    print(path);
    if (await Directory(dirname(path)).exists()) {
      database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE survey (id INTEGER PRIMARY KEY, title TEXT)');
      });
      emit(LoadDatabaseState());
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
        database = await openDatabase(path, version: 1,
            onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE survey (id INTEGER PRIMARY KEY, title TEXT)');
        });
        emit(LoadDatabaseState());
      } catch (e) {
        log(e.toString());
      }
    }
  }
}
