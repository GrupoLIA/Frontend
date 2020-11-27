import 'package:flutter/material.dart';
import 'package:lia_frontend/app/constants.dart';

class ContractListItem extends StatelessWidget {
  final String id;
  final String status;
  final bool hasReview;
  final String employer;
  final String employee;
  final String trade;
  final Function onTapFunction;

  const ContractListItem(
      {Key key,
      this.id,
      this.status,
      this.hasReview,
      this.employer,
      this.employee,
      this.trade,
      this.onTapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 16,
                color: Colors.grey[400],
              ),
            ],
            borderRadius: BorderRadius.circular(5)),
        child: id == LoadingIndicatorID
            ? CircularProgressIndicator()
            : Text(trade),
        alignment: Alignment.center,
      ),
    );
  }
}
