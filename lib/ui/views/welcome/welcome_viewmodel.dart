import 'package:lia_frontend/app/locator.dart';
import 'package:lia_frontend/app/router.gr.dart';
import 'package:lia_frontend/services/api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WelcomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future navigateToLogin() async {
    await _navigationService.navigateTo(Routes.LoginViewRoute);
  }

  Future navigateToSignup() async {
    await _navigationService.navigateTo(Routes.SignupViewRoute);
  }
}
