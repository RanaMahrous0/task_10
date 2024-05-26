import 'package:flutter/material.dart';
import 'package:sqlite/pages/add_employee.dart';
import 'package:sqlite/pages/list_employee.dart';
import 'package:sqlite/pages/my_home.dart';
import 'package:sqlite/sqlhelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sqlhelper = SqlHelper();
  await sqlhelper.initDatabase();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ListEmpolyee(),
        '/add': (context) => AddEmployee()
      },
      // home: HomePage(),
    );
  }
}
