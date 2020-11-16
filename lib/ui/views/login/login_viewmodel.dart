import 'package:lia_frontend/app/locator.dart';
import 'package:lia_frontend/app/router.gr.dart';
import 'package:lia_frontend/services/api.dart';
import 'package:lia_frontend/services/authentication_service.dart';
import 'package:lia_frontend/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final Api _api = locator<Api>();
  final NavigationService _navigationService = locator<NavigationService>();
  final UserService _userService = locator<UserService>();

  String _email = "";
  String _password = "";

  void updateEmail(String value) {
    _email = value;
  }

  void updatePassword(String value) {
    _password = value;
  }

  Future submit() async {
    await _api.login(_email, _password);
    _userService.initUserModel();
    await _navigationService.navigateTo(Routes.HomeViewRoute);
  }
}
