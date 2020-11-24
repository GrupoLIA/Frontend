import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:lia_frontend/app/locator.dart';
import 'package:lia_frontend/services/api.dart';

@lazySingleton
class AuthenticationService {
  final _storage = FlutterSecureStorage();

  var _jwt;

  String get jwt => _jwt;

  Future<String> readJWT() async {
    print("readJWT");
    var jwt = await _storage.read(key: "jwt");
    if (jwt == null) return null;
    _jwt = jwt;
    return jwt;
  }

  deleteAll() async {
    await _storage.deleteAll();
  }

  writeInStorage(String value) async {
    print("writeInStorage");
    await _storage.write(key: "jwt", value: value);
  }
}
