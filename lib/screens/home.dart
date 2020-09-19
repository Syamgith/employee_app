import 'package:employee_app/api_provider.dart';
import 'package:employee_app/screens/employee_list.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  String name;
  String job;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employees'),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ADD EMPLOYEE',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            SizedBox(
              height: 14.0,
            ),
            TextField(
              onChanged: (val) {
                name = val;
              },
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(
              height: 14.0,
            ),
            TextField(
              onChanged: (val) {
                job = val;
              },
              decoration: InputDecoration(labelText: 'Job'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RaisedButton(
              onPressed: () {
                ApiProvider().addEmployee(name, job);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              color: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Or'),
            ),
            FlatButton(
              onPressed: () {
                ApiProvider().fetchEmployees();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmployeeList(),
                  ),
                );
              },
              child: Text(
                'See employee list',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
