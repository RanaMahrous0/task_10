import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:sqlite/sqlhelper.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  var nameController = TextEditingController();
  var formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  label: Text('Name'), hintText: 'Enter Employee Name'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  var sqlHelper = GetIt.I.get<SqlHelper>();

                  sqlHelper.insertItem(nameController.text);

                  Navigator.pop(context, true);
                } catch (e) {
                  print('error $e');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
