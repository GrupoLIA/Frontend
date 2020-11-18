import 'package:flutter/material.dart';
import 'package:lia_frontend/app/constants.dart';

class ListItem extends StatelessWidget {
  final String email;
  const ListItem({Key key, this.email}) : super(key: key);

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
      child: email == LoadingIndicatorEmail
          ? CircularProgressIndicator()
          : Text(email),
      alignment: Alignment.center,
    );
  }
}
