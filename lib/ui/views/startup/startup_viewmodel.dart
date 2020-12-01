import 'package:lia_frontend/app/locator.dart';
import 'package:lia_frontend/services/authentication_service.dart';
import 'package:lia_frontend/services/user_service.dart';
import 'package:stacked/stacked.dart';

class StartupViewModel extends FutureViewModel<String> {
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  UserService _userService = locator<UserService>();

  @override
  Future<String> futureToRun() async {
    final res = await _authenticationService.readJWT();
    print("hasJWT method - readJWT() $res");
    // Debería crear un usuario y ponerlo en el UserService
    if (res != null) {
      await _userService.initUserModel(res);
    }
    print("JWT is $res");
    return res;
  }
}
