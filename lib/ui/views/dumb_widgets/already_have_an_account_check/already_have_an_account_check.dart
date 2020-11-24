import 'package:flutter/material.dart';
import 'package:lia_frontend/app/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final login;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(login ? "¿No tenés una cuenta? " : "¿Ya tenés una cuenta? "),
        GestureDetector(
          child: Text(
            login ? "SIGNUP" : "LOGIN",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
