import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqlite/models/empolyee.dart';
import 'package:path_provider/path_provider.dart';

class SqlHelper {
  late Database db;
  // static final SqlHelper instance = SqlHelper._privateConstructor();
  // SqlHelper._privateConstructor();

  Future<Database> get database async {
    if (db != null) return db;
    db = await open();
    return db;
  }

  Future open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'empolyee.db');
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table employee (
  id integer primary key autoincrement,
  name text not null
 )
''');
    });
  }
  // Future<Database> get database async {
  //   if (db != null) return db!;
  //   db = await initDatabase();
  //   return db;
  // }

  // Future<Database> initDatabase() async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final path = join(directory.path, 'employee_database.db');
  //   return await openDatabase(path, version: 1, onCreate: _createDb);
  // }

  // Future<void> _createDb(Database db, int version) async {
  //   await db.execute('''
  //     CREATE TABLE employee(
  //       id INTEGER PRIMARY KEY AUTOINCREMENT,
  //       name TEXT
  //     )
  //   ''');
  // }

  // Future<List<Employee>> getEmployees() async {
  //   final db = await database;
  //   final List<Map<String, dynamic>> maps = await db.query('employee');
  //   return List.generate(maps.length, (i) {
  //     return Employee(
  //       id: maps[i]['id'],
  //       name: maps[i]['name'],
  //     );
  //   });
  // }

  // Future<int> insertEmployee(Employee employee) async {
  //   final db = await database;
  //   return await db.insert('employee', {'name': employee.name});
  // }
}
