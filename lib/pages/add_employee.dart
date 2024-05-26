// import 'package:flutter/material.dart';
// import 'package:sqlite/models/empolyee.dart';
// import 'package:sqlite/sqlhelper.dart';

// class AddEmployee extends StatefulWidget {
//   const AddEmployee({super.key});

//   @override
//   State<AddEmployee> createState() => _AddEmployeeState();
// }

// class _AddEmployeeState extends State<AddEmployee> {
// var nameController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Employee'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,

//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(
//                 label: Text('Name'),
//                 hintText: 'enter employee name'
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(onPressed: (){
//               _addEmployee(context);
//             }, child: Text('Add'))
//           ],),
//       ),
//     );
   
//   }
//   void _addEmployee (BuildContext context)async{
//     if(nameController.text.isNotEmpty){
//       final employee = Employee(id: 0, name: nameController.text);
//       await SqlHelper.instance.insertEmployee(employee);
//       Navigator.pop(context);
//     }
//   }
// }