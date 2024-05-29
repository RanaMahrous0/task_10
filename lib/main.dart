import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sqlite/pages/add_employee.dart';
import 'package:sqlite/pages/list_employee.dart';
import 'package:sqlite/sqlhelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sqlhelper = SqlHelper();
  await sqlhelper.initDatabase();
  if (sqlhelper.db != null){
    GetIt.I.registerSingleton <SqlHelper>(sqlhelper);
  }


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const ListEmpolyee(),
        '/add': (context) => const AddEmployee()
      },
  
    );
  }
}
