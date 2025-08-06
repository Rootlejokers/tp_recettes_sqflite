import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../models/redipe_model.dart';

import 'package:path/path.dart';


class DatabaseHelper {
  static final _instance = DatabaseHelper._();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._();

  static Database? _db;
  Future get db async {
    if (_db != null) return _db!;
    final path = join(await getDatabasesPath(), 'recipes.db');
    _db = await openDatabase(path, version: 1, onCreate: (db, v) {
      db.execute('''CREATE TABLE recipes(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT, description TEXT)''');
    });
    return _db!;
  }

  Future getAll() async {
    final database = await db;
    final rows = await database.query('recipes');
    return rows.map((m) => Recipe.fromMap(m)).toList();
  }

  Future insert(Recipe r) async {
    return (await db).insert('recipes', r.toMap());
  }

  Future delete(int id) async {
    return (await db).delete('recipes', where: 'id = ?', whereArgs: [id]);
  }
}