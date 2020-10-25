import 'package:flutter/material.dart';
import 'package:lia_frontend/app/locator.dart';
import 'package:lia_frontend/app/router.gr.dart' as Router;
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicacion de oficios',
      onGenerateRoute: Router.Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
