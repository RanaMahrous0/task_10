// import 'package:flutter/material.dart';
// import 'package:sqlite/sqlhelper.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   var sqlhelper = SqlHelper();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My App'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () async {
//                     try {
//                       sqlhelper.db.insert('employee', {'name': 'rana'});
//                       sqlhelper.db.insert('employee', {'name': 'salma'});
//                       sqlhelper.db.insert('employee', {'name': 'ali'});

//                       print('done');
//                     } catch (e) {
//                       print('error  $e');
//                     }
//                   },
//                   child: Text('add'),
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       foregroundColor: Colors.white),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     await sqlhelper.initDatabase();
//                     List<Map<String, Object?>> records =
//                         await sqlhelper.db.query('employee');
//                     print(records);
//                   },
//                   child: Text('show'),
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       foregroundColor: Colors.white),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
