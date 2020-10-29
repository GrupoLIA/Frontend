// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/home/home_view.dart';
import '../ui/views/login/login_view.dart';
import '../ui/views/signup/signup_view.dart';
import '../ui/views/welcome/welcome_view.dart';

class Routes {
  static const String HomeViewRoute = '/home-view';
  static const String WelcomeViewRoute = '/';
  static const String LoginViewRoute = '/login-view';
  static const String SignupViewRoute = '/signup-view';
  static const all = <String>{
    HomeViewRoute,
    WelcomeViewRoute,
    LoginViewRoute,
    SignupViewRoute,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.HomeViewRoute, page: HomeView),
    RouteDef(Routes.WelcomeViewRoute, page: WelcomeView),
    RouteDef(Routes.LoginViewRoute, page: LoginView),
    RouteDef(Routes.SignupViewRoute, page: SignupView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    WelcomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WelcomeView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    SignupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignupView(),
        settings: data,
      );
    },
  };
}
