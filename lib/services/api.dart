import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:injectable/injectable.dart';

@lazySingleton
class Api {
  static const String endpoint = "http://localhost:3000/";
  var client = http.Client();

  Future<void> login(String email, String password) async {
    var response =
        await client.post('$endpoint/users/login', body: {email, password});
    print("LOGIN RESPONSE: $response");
  }

  Future<void> signup() async {}
}
