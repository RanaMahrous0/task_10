import 'package:sqflite/sqflite.dart';

class SqlHelper {
  Database? db;

  Future<void> initDatabase() async {
    db = await openDatabase(
      "employee.db",
      version: 1,
      onCreate: (db, version) {
        print('database done');
      },
    );
  }

  Future<void> createTable() async {
    await initDatabase();
    try {
      await db!.execute('''
      CREATE TABLE if not exists employee(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT
      )
    ''');
    } catch (e) {
      print('error $e');
    }
  }

  Future<List<Map<String, dynamic>>> getEmployees() async {
    await initDatabase();
    return await db!.query('employee');
  }

  Future<void> insertItem(String name) async {
    await db!.insert('employee', {'name': name});
    getEmployees();
  }
}
