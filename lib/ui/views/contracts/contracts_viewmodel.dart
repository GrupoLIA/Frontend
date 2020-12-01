import 'package:lia_frontend/app/constants.dart';
import 'package:lia_frontend/app/locator.dart';
import 'package:lia_frontend/app/router.gr.dart';
import 'package:lia_frontend/datamodels/contract.dart';
import 'package:lia_frontend/services/api.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ContractsViewModel extends FutureViewModel {
  final Api _api = locator<Api>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final bool isEmployee;
  List<Contract> _items;

  ContractsViewModel({this.isEmployee});
  List<Contract> get items => _items;

  ItemScrollController _itemScrollController = ItemScrollController();

  ItemScrollController get itemScrollController => _itemScrollController;

  static const int ItemRequestThreshold = 15;
  int _currentPage = 0;

  Future handleItemCreated(int index) async {
    var itemPosition = index + 1;
    var requestMoreData =
        itemPosition % ItemRequestThreshold == 0 && itemPosition != 0;
    var pageToRequest = itemPosition ~/ ItemRequestThreshold;
    if (requestMoreData && pageToRequest > _currentPage) {
      _currentPage = pageToRequest;

      _showLoadingIndicator();
      var newFetchedItems = await _api.getContracts(
          isEmployee: this.isEmployee,
          skip: ItemRequestThreshold * _currentPage,
          limit: ItemRequestThreshold);
      await Future.delayed(Duration(seconds: 2));
      _items.addAll(newFetchedItems);
      _removeLoadingIndicator();
      notifyListeners();
    }
  }

  void _showLoadingIndicator() {
    _items.add(new Contract(id: LoadingIndicatorID));
    notifyListeners();
  }

  void _removeLoadingIndicator() {
    _items.removeAt(ItemRequestThreshold * _currentPage);
    notifyListeners();
  }

  Future showAcceptContractConfirmationDialog(String contractID) async {
    DialogResponse response = await _dialogService.showConfirmationDialog(
      title: "Aceptar contrato",
      description: "¿Seguro desea aceptar este contrato?",
      confirmationTitle: "Yes",
      cancelTitle: "No",
    );
    var _confirmationResult = response?.confirmed;

    if (_confirmationResult) {
      await _api.acceptContract(contractID);
    }
  }

  Future showCreateReviewConfirmationDialog(String contractID) async {
    DialogResponse response = await _dialogService.showConfirmationDialog(
      title: "Crear review",
      description: "¿Seguro desea crear una review?",
      confirmationTitle: "Si",
      cancelTitle: "No",
    );
    var _confirmationResult = response?.confirmed;

    if (_confirmationResult) {
      await _navigationService.navigateTo(Routes.CreateReviewViewRoute,
          arguments: {"contractID": contractID});
    }
  }

  @override
  Future futureToRun() async {
    _items = await _api.getContracts(isEmployee: this.isEmployee);
    return _items;
  }
}
