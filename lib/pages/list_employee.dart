import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite/models/empolyee.dart';
import 'package:sqlite/sqlhelper.dart';

class ListEmpolyee extends StatefulWidget {
  const ListEmpolyee({super.key});

  @override
  State<ListEmpolyee> createState() => _ListEmpolyeeState();
}

class _ListEmpolyeeState extends State<ListEmpolyee> {
  late Database db;
  List<Map<String, Object?>> employees = [];
  var sqlhelper = SqlHelper();

  @override
  Future<void> _getEmployees() async {
    await sqlhelper.initDatabase();
    List<Map<String, Object?>> records = await db.query('my_table');
    setState(() {
      employees = records;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(employees.toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
