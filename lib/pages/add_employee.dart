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
                  label: Text('Name'), hintText: 'enter employee name'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    var sqlHelper = GetIt.I.get<SqlHelper>();
               
                  
                   sqlHelper.insertItem(nameController.text);

                    Navigator.pop(context);
                  } catch (e) {
                    print('error $e');
                  }
                },
                child: const Text('Add'))
          ],
        ),
      ),
    );
  }
}
