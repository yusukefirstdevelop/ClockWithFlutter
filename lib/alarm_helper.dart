import 'dart:async';
import "package:sqflite/sqflite.dart";
import "package:sqflite/sqlite_api.dart";
import 'package:uitraining/models/alarm_info.dart';

final String tableAlarm = "alarm";
final String columnId = "id";
final String columnTitle = "title";
final String columnDateTime = "alarmDateTime";
final String columnPending = "isPending";
final String columnColorIndex = "gradientColorIndex";

class AlarmHelper {
  static Database? _database;
  static AlarmHelper instance = AlarmHelper._createInstance();

  AlarmHelper._createInstance();

  // AlarmHelper._createInstance();
  // factory AlarmHelper() {
  //   _alarmHelper ??= AlarmHelper._createInstance();
  //   return _alarmHelper;
  // }

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
    //OUTRO JEITO DE ESCREVER
    // _database ??= await initializeDatabase();
    // return _database;
  }

  Future<Database?> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "alarm.db";

    // criando as tabelas e colunas nos bancos de dado
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(""" 
            create table $tableAlarm (
              $columnId integer primary key autoincrement,
              $columnTitle text not null,
              $columnDateTime text not null,
              $columnPending integer,
              $columnColorIndex integer
            )
        """);
      },
    );
  }

  void insertAlarm(AlarmInfo alarmInfo) async {
    var db = await this.database;
    var result = await db?.insert(tableAlarm, alarmInfo.toMap());
    print("result: $result");
  }
}
