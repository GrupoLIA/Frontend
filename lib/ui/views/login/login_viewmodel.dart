import 'package:lia_frontend/app/locator.dart';
import 'package:lia_frontend/services/api.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final Api _api = locator<Api>();

  String _email;
  String _password;

  void updateEmail(String value) {
    _email = value;
  }

  void updatePassword(String value) {
    _password = value;
  }
}
