import 'package:flutter/material.dart';

import '../api_provider.dart';

class EmployeeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee list'),
      ),
      body: Container(
        child: FutureBuilder(
          future: ApiProvider().fetchEmployees(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data['data'];
              return ListView.builder(
                itemCount: (data as List).length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text(
                        '${data[index]['first_name']} ${data[index]['last_name']}',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Image.network(data[index]['avatar']),
                      subtitle: Text('${data[index]['email']}'),
                      //trailing: Text('${data[index]['email']}'),
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
