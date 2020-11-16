import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:lia_frontend/datamodels/user.dart';
import 'package:lia_frontend/app/locator.dart';
import 'package:lia_frontend/services/authentication_service.dart';

@lazySingleton
class Api {
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  static const String endpoint = "http://10.0.2.2:3000";
  var client = http.Client();

  Future<dynamic> login(String email, String password) async {
    final response = await client.post('$endpoint/api/users/signin',
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));
    if (response.statusCode == 200) {
      var decodedJson = json.decode(response.body);
      await _authenticationService.writeInStorage(decodedJson['data']['token']);
      //le puse un await

    } else {
      //TODO: Show a toast or some sort of Alert indicating either email or password are incorrect.
      throw Exception('Failed to login user');
    }
  }

  Future<dynamic> logout(String jwt) async {
    final response = await client.post("$endpoint/api/users/logout",
        headers: <String, String>{'Authorization': 'Bearer $jwt'});

    if (response.statusCode != 200) {
      //TODO: Show a toast or some sort of Alert indicating either email or password are incorrect.
      throw Exception('Failed to logout');
    }
  }

  Future<void> signup() async {}

  Future<void> getUsers() async {
    final response = await client.get('$endpoint/api/users');
  }

  Future<User> getUserProfile([String token]) async {
    var jwt;
    if (token == null) {
      jwt = await _authenticationService.readJWT();
    } else {
      jwt = token;
    }
    var response = await client.get('$endpoint/api/users/profile',
        headers: <String, String>{'Authorization': 'Bearer $jwt'});
    return User.fromJson(json.decode(response.body)['data']);
  }
}
