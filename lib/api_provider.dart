import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiProvider {
  Future<bool> addEmployee(String name, String job) async {
    var response = await http
        .post('https://reqres.in/api/users', body: {'name': name, 'job': job});
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    return response.statusCode == 201;
  }

  Future<dynamic> fetchEmployees() async {
    var response = await http.get('https://reqres.in/api/users');
    //print('Response status: ${response.statusCode}');
    var decodedBody = jsonDecode(response.body);
    return decodedBody;
  }
}
