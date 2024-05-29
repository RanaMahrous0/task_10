import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import 'package:sqlite/sqlhelper.dart';

class ListEmpolyee extends StatefulWidget {
  const ListEmpolyee({super.key});

  @override
  State<ListEmpolyee> createState() => _ListEmpolyeeState();
}

class _ListEmpolyeeState extends State<ListEmpolyee> {
  late Database db;
  Future<List<Map<String, dynamic>>>? employees;

  var sqlHelper = GetIt.I.get<SqlHelper>();
  @override
  void initState() {
    init();
    employees = sqlHelper.getEmployees();

    super.initState();
  }

  void init() async {
    await sqlHelper.createTable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Employee',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: myFutureBuilder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget myFutureBuilder() {
    return FutureBuilder(
      future: employees,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          final data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(
                  data[index]['name'],
                ),
              );
            },
          );
        }
      },
    );
  }
}
