// ignore_for_file: leading_newlines_in_multiline_strings

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteProvider {
  SqliteProvider._();

  static Future<SqliteProvider> getInstance() async {
    await _initDB();
    return SqliteProvider._();
  }

  String get logsTable => _logsTable;

  // Public functions
  Future<int> Function(String table, Map<String, Object?> values,
      {ConflictAlgorithm? conflictAlgorithm,
      String? nullColumnHack}) get insert => _database.insert;
  Future<int> Function(String table, {String? where, List<Object?>? whereArgs})
      get delete => _database.delete;
  Future<T> Function<T>(Future<T> Function(Transaction txn) action,
      {bool? exclusive}) get transaction => _database.transaction;
  Future<List<Map<String, Object?>>> Function(String table,
      {List<String>? columns,
      bool? distinct,
      String? groupBy,
      String? having,
      int? limit,
      int? offset,
      String? orderBy,
      String? where,
      List<Object?>? whereArgs}) get query => _database.query;
  Future<int> Function(String sql, [List<Object?>? arguments]) get rawUpdate =>
      _database.rawUpdate;

  // Static values
  static late Database _database;
  static const _dbName = 'myDB';
  static const _dbVersion = 1;
  static const _logsTable = 'logs';

  static Future<void> _initDB() async {
    final path = join(await getDatabasesPath(), '$_dbName.db');
    _database = await openDatabase(
      path,
      version: _dbVersion,
      onOpen: (_) {},
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  static FutureOr<void> _onUpgrade(Database db, int currentV, int newV) async {
    if (currentV <= 1 && newV >= 2) {}
  }

  static FutureOr<void> _onCreate(Database db, int version) async {
    if (version == 1) {
      await db.transaction((txn) async {
        await txn.execute('CREATE TABLE $_logsTable( '
            'created_at INTEGER NOT NULL, '
            'content TEXT NOT NULL '
            ')');
      });
    }
  }
}
