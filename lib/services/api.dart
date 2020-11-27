import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:lia_frontend/datamodels/contract.dart';
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

  Future<dynamic> signup(String email, String password) async {
    final response = await client.post('$endpoint/api/users/signup',
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));

    if (response.statusCode == 201) {
      var decodedJson = json.decode(response.body);
      await _authenticationService.writeInStorage(decodedJson['data']['token']);
    } else {
      throw Exception('Failed to create user');
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

  Future<List<User>> getUsers(
      {String email, String trade, int skip, int limit}) async {
    var users = List<User>();
    var response = await client.get(
        '$endpoint/api/users?email=$email&trade=$trade&skip=$skip&limit=$limit');
    var parsed = json.decode(response.body)['data'] as List<dynamic>;
    for (var user in parsed) {
      users.add(User.fromJson(user));
    }
    return users;
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
    return User.fromJson(json.decode(response.body)['data']['user']);
  }

  Future createContract(String employeeID, String trade) async {
    var jwt = _authenticationService.jwt;
    if (jwt == null) return;

    var response = await client.post('$endpoint/api/contracts',
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $jwt'
        },
        body: jsonEncode(
            <String, String>{'employee': employeeID, 'trade': trade}));
    if (response.statusCode == 501) {
      print("We lost boys");
    }
  }

  Future<List<Contract>> getContracts(
      {bool isEmployee, int limit, int skip}) async {
    var jwt = _authenticationService.jwt;
    if (jwt == null) return [];

    var _endpointString =
        '$endpoint/api/contracts${isEmployee ? '?isEmployee=true' : ''}';
    print("LA endpoint string es: $_endpointString");

    var response = await client.get(
      _endpointString,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt'
      },
    );
    if (response.statusCode == 200) {
      List<Contract> contracts = List<Contract>();

      var parsed =
          (json.decode(response.body)['data']['contracts']) as List<dynamic>;
      print("PARSED");
      print(parsed);
      for (var contract in parsed) {
        contracts.add(Contract.fromJson(contract));
      }
      return contracts;
    } else {
      print("We lost boys");
    }
  }

  Future<void> acceptContract(String contractID) async {
    var jwt = _authenticationService.jwt;
    if (jwt == null) return;

    var response = await client.patch(
      '$endpoint/api/contracts/$contractID',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt'
      },
    );
    if (response.statusCode == 200) {
      print("Se aceptó el contrato");
    } else {
      print("Fallo en aceptarse el contrato");
    }
  }

  Future<String> createReview(String contractID, String title,
      String description, double rating) async {
    var res = "";
    var jwt = _authenticationService.jwt;
    if (jwt == null) res = "Internal Error";

    var response = await client.post('$endpoint/api/reviews/$contractID',
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $jwt'
        },
        body: jsonEncode(
            {'title': title, 'description': description, 'rating': rating}));

    print(response.body);
    if (response.statusCode == 200) {
      res = "Review created successfully!";
    } else {
      res = json.decode(response.body)['error'];
    }
    return res;
  }
}
