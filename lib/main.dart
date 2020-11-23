import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:lia_frontend/app/constants.dart';
import 'package:lia_frontend/app/locator.dart';
import 'package:lia_frontend/app/router.gr.dart' as Router;
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(DevicePreview(enabled: false, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicacion de oficios',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
          primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
    );
  }
}

_decideMainPage() {}
