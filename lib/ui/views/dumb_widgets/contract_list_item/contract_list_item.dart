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
    return onTapFunction != null
        ? GestureDetector(
            onTap: () => onTapFunction(this.id),
            behavior: HitTestBehavior.translucent,
            child: InnerTile(id: id, trade: trade, status: status),
          )
        : InnerTile(id: id, trade: trade, status: status);
  }
}

class InnerTile extends StatelessWidget {
  const InnerTile({
    Key key,
    @required this.id,
    @required this.trade,
    @required this.status,
  }) : super(key: key);

  final String id;
  final String trade;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Se requiere $trade"),
                Text("El estado del contrato es $status"),
              ],
            ),
      alignment: Alignment.center,
    );
  }
}
