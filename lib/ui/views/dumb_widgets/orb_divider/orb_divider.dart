import 'package:flutter/material.dart';
import 'package:lia_frontend/app/constants.dart';

class OrbDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: [
          _buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style:
                  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
            ),
          ),
          _buildDivider(),
        ],
      ),
    );
  }
}

Expanded _buildDivider() {
  return Expanded(
    child: Divider(
      color: Color(0xFFD9D909),
      height: 1.5,
    ),
  );
}
