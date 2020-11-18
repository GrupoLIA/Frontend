import 'package:flutter/material.dart';
import 'package:lia_frontend/app/constants.dart';
import 'package:lia_frontend/app/locator.dart';
import 'package:lia_frontend/app/router.gr.dart';
import 'package:lia_frontend/datamodels/user.dart';
import 'package:lia_frontend/services/api.dart';
import 'package:lia_frontend/services/authentication_service.dart';
import 'package:lia_frontend/services/user_service.dart';
import 'package:lia_frontend/ui/views/home/home_view.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel {
  List<User> _items;
  List<User> get items => _items;

  ItemScrollController _itemScrollController = ItemScrollController();

  ItemScrollController get itemScrollController => _itemScrollController;

  String _activeIndex = 'Gasista';
  String _prevActiveIndex = 'Gasista';

  String get activeIndex => _activeIndex;

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
      var newFetchedItems = await _api.getUsers(
          trade: _activeIndex.toLowerCase(),
          skip: ItemRequestThreshold * _currentPage,
          limit: ItemRequestThreshold);

      _items.addAll(newFetchedItems);

      _removeLoadingIndicator();
    }
  }

  void _showLoadingIndicator() {
    _items.add(new User(email: LoadingIndicatorTitle));
    notifyListeners();
  }

  void _removeLoadingIndicator() {
    _items.removeAt(ItemRequestThreshold * _currentPage);
    notifyListeners();
  }

  UserService _userService = locator<UserService>();

  AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  Api _api = locator<Api>();

  NavigationService _navigationService = locator<NavigationService>();

  String getUserProfile() {
    return _userService.user.toString();
  }

  void changeActiveCategory(String trade) async {
    if (_prevActiveIndex != trade) {
      _prevActiveIndex = trade;
      _activeIndex = trade;
      _currentPage = 0;
      _itemScrollController.jumpTo(index: 0);
      _items = await runBusyFuture(_api.getUsers(
          trade: _activeIndex.toLowerCase(),
          skip: ItemRequestThreshold * _currentPage,
          limit: ItemRequestThreshold));
      notifyListeners();
    }
  }

  Future navigateToDetails(String email, String profileDescription) async {
    await _navigationService.navigateTo(Routes.DetailsViewRoute,
        arguments: {"email": email, "profileDescription": profileDescription});
  }

  void logoutUser() async {
    await _api.logout(_authenticationService.jwt);
    await _authenticationService.deleteAll();
    await _navigationService.clearStackAndShow(Routes.WelcomeViewRoute);
  }

  @override
  Future futureToRun() async {
    print("FUTURE TO RUN");
    _items = await _api.getUsers(
        trade: _activeIndex.toLowerCase(),
        skip: ItemRequestThreshold * _currentPage,
        limit: ItemRequestThreshold);
  }
}
