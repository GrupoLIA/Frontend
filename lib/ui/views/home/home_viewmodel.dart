import 'package:lia_frontend/app/locator.dart';
import 'package:lia_frontend/app/router.gr.dart';
import 'package:lia_frontend/services/api.dart';
import 'package:lia_frontend/services/authentication_service.dart';
import 'package:lia_frontend/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  UserService _userService = locator<UserService>();
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  Api _api = locator<Api>();
  NavigationService _navigationService = locator<NavigationService>();

  String getUserProfile() {
    return _userService.user.toString();
  }

  void logoutUser() async {
    await _api.logout(_authenticationService.jwt);
    await _authenticationService.deleteAll();
    await _navigationService.clearStackAndShow(Routes.WelcomeViewRoute);
  }
}
