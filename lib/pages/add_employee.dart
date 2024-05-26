import 'package:flutter/material.dart';
import 'package:sqlite/models/empolyee.dart';
import 'package:sqlite/sqlhelper.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  var nameController = TextEditingController();
  var sqlhelper = SqlHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  label: Text('Name'), hintText: 'enter employee name'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    var sqlhelper = SqlHelper();
                    await sqlhelper.initDatabase();
                    // await sqlhelper.createTable();
                    await sqlhelper.db
                        .insert('employee', {'name': nameController.text});
                    List<Map<String, Object?>> records =
                        await sqlhelper.db.query('employee');
                    print(records);

                    Navigator.pop(context, records);
                  } catch (e) {
                    print('error $e');
                  }
                },
                child: Text('Add'))
          ],
        ),
      ),
    );
  }
}
