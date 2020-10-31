import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:lia_frontend/datamodels/user.dart';

@lazySingleton
class Api {
  //static const String endpoint = "http://localhost:3000/";
  static const String endpoint = "http://10.0.2.2:3000";
  var client = http.Client();

  Future<User> login(String email, String password) async {
    final response = await client.post('$endpoint/api/users/signin',
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body)['data']['user']);
    } else {
      //TODO: Show a toast or some sort of Alert indicating either email or password are incorrect.
      throw Exception('Failed to login user');
    }
  }

  Future<void> signup() async {}

  Future<void> getUsers() async {
    final response = await client.get('$endpoint/api/users');
  }
}
