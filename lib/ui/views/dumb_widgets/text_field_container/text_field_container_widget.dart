import 'package:flutter/material.dart';
import 'package:lia_frontend/app/constants.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    Key key,
    @required this.size,
    @required this.child,
  }) : super(key: key);

  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
