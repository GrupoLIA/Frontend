import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lia_frontend/app/locator.dart';
import 'package:lia_frontend/datamodels/review.dart';
import 'package:lia_frontend/services/api.dart';
import 'package:stacked/stacked.dart';

class ShowReviewViewModel extends FutureViewModel {
  final Api _api = locator<Api>();
  List<Review> _items;
  List<Review> get items => _items;

  @override
  Future futureToRun() async {
    _items = await _api.showReviews();
    return items;
  }
}
