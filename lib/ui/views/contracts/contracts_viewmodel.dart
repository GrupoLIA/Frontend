import 'package:lia_frontend/app/constants.dart';
import 'package:lia_frontend/app/locator.dart';
import 'package:lia_frontend/datamodels/contract.dart';
import 'package:lia_frontend/services/api.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:stacked/stacked.dart';

class ContractsViewModel extends FutureViewModel {
  /*TODO: Infinite scrolling is not done in the backend but is configured to work here.
          Just have to change the API service.
  */

  final Api _api = locator<Api>();
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

  @override
  Future futureToRun() async {
    _items = await _api.getContracts(isEmployee: this.isEmployee);
    return _items;
  }
}
