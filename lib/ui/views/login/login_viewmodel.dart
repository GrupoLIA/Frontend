import 'package:lia_frontend/app/locator.dart';
import 'package:lia_frontend/app/router.gr.dart';
import 'package:lia_frontend/services/api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final Api _api = locator<Api>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _email = "";
  String _password = "";

  void updateEmail(String value) {
    _email = value;
  }

  void updatePassword(String value) {
    _password = value;
  }

  Future submit() async {
    /*  - validar si es correcto lo ingresado (longitud, empty...)
        - se llama a la api y si responde bien se manda a la HomeView
    */
    final user = await _api.login(_email, _password);

    await _navigationService.navigateTo(Routes.HomeViewRoute, arguments: user);
  }
}
