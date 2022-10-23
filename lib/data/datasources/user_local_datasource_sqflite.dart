import 'dart:async';
import 'package:loggy/loggy.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../domain/entities/user.dart';

class UserLocalDataSource {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, firstName TEXT, secondName TEXT, lastName TEXT, secondLastName TEXT, idType TEXT, country TEXT, idNumber TEXT, firstDay TEXT, area TEXT, status TEXT, registerDate TEXT)');
  }

  Future<void> addUser(User user) async {
    logInfo("Adding user to db");
    final db = await database;

    await db.insert(
      'users',
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteUser(String id) async {
    logInfo("Adding user to db");
    final db = await database;

    await db.delete('users', where: "id = ?", whereArgs: [id]);
  }

  Future<void> updateUser(User user) async {
    logInfo("Adding user to db");
    final db = await database;

    await db
        .update('users', user.toJson(), where: "id = ?", whereArgs: [user.id]);
  }

  Future<User> getUser(String id) async {
    final db = await database;
    List<Map<String, dynamic>> user =
        await db.query("users", where: "id = ?", whereArgs: [id]);
    return User.fromJson(user[0]);
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await database;

    final List<Map<String, dynamic>> users = await db.query('users');
    print(users);
    return users;
    // return List.generate(users.length, (i) {
    //   //keep in mind the index
    //   return User.fromJson(users[i]);
    // });
  }

  Future<void> deleteAll() async {
    Database db = await database;
    await db.delete('users');
  }
}
