import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lia_frontend/app/locator.dart';
import 'package:lia_frontend/services/api.dart';
import 'package:stacked/stacked.dart';

class CreateReviewViewModel extends BaseViewModel {
  final Api _api = locator<Api>();

  String _title = "";
  String _description = "";
  double _rating;

  final String contractID;

  CreateReviewViewModel({this.contractID});

  void updateTitle(String value) {
    _title = value;
  }

  void updateDescription(String value) {
    _description = value;
  }

  void updateRating(double value) {
    _rating = value;
  }

  Future createReview() async {
    String result =
        await _api.createReview(this.contractID, _title, _description, _rating);
    Fluttertoast.showToast(
        msg: result,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.grey[700],
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }
}
