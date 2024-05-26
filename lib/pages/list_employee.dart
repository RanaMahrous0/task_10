// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqlite/models/empolyee.dart';
// import 'package:sqlite/sqlhelper.dart';

// class ListEmpolyee extends StatefulWidget {
//   const ListEmpolyee({super.key});

//   @override
//   State<ListEmpolyee> createState() => _ListEmpolyeeState();
// }

// class _ListEmpolyeeState extends State<ListEmpolyee> {
//   late Database db;
//   List<Employee> employees = [];

//   @override
//   void initState() {
//     super.initState();
//     SqlHelper.instance.initDatabase();
//     _getEmployees();
//   }

//   Future<void> _getEmployees() async {
//     final List<Employee> fetchedEmployees =
//         await SqlHelper.instance.getEmployees();
//     setState(() {
//       employees = fetchedEmployees;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Employee'),
//         backgroundColor: Colors.blue,
//       ),
//       body: ListView.builder(
//         itemCount: employees.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(employees[index].name),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pushNamed(context, '/add');
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
