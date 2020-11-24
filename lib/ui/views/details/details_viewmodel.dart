import 'package:lia_frontend/app/locator.dart';
import 'package:lia_frontend/services/api.dart';
import 'package:lia_frontend/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailsViewModel extends BaseViewModel {
  final trade;
  final employeeID;
  final Api _api = locator<Api>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final UserService _userService = locator<UserService>();

  DetailsViewModel({this.employeeID, this.trade});

  Future showConfirmationDialog() async {
    DialogResponse response = await _dialogService.showConfirmationDialog(
      title: "Crear contrato",
      description: "¿Seguro desea contratar a este empleado?",
      confirmationTitle: "Yes",
      cancelTitle: "No",
    );
    var _confirmationResult = response?.confirmed;

    if (_confirmationResult) {
      await _api.createContract(employeeID, trade);
    }
  }

  void pop() {
    _navigationService.popRepeated(1);
  }
}
