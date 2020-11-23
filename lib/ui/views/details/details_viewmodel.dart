import 'package:lia_frontend/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailsViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  void pop() {
    _navigationService.popRepeated(1);
  }
}
