import 'package:injectable/injectable.dart';
import 'package:lia_frontend/app/locator.dart';
import 'package:lia_frontend/datamodels/user.dart';
import 'dart:convert';

import 'package:lia_frontend/services/api.dart';

@lazySingleton
class UserService {
  final _api = locator<Api>();
  User _userModel;

  User get user => _userModel;

  Future<void> initUserModel([String jwt]) async {
    // var parsedPayload = parseJwtPayLoad(jwt);
    // print(parsedPayload);
    // _userModel = User.fromJson(parsedPayload);
    _userModel = await _api.getUserProfile(jwt);
    print("The user model is $_userModel");
  }

  Map<String, dynamic> parseJwtPayLoad(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  Map<String, dynamic> parseJwtHeader(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[0]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }
}
