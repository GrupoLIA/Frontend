// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/contracts/contracts_created/contracts_created_view.dart';
import '../ui/views/contracts/contracts_received/contracts_received_view.dart';
import '../ui/views/details/details_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/login/login_view.dart';
import '../ui/views/reviews/create_review/create_review_view.dart';
import '../ui/views/signup/signup_view.dart';
import '../ui/views/startup/startup_view.dart';
import '../ui/views/welcome/welcome_view.dart';

class Routes {
  static const String StartupViewRoute = '/';
  static const String WelcomeViewRoute = '/welcome-view';
  static const String LoginViewRoute = '/login-view';
  static const String SignupViewRoute = '/signup-view';
  static const String HomeViewRoute = '/home-view';
  static const String DetailsViewRoute = '/details-view';
  static const String ContractsCreatedViewRoute = '/contracts-created-view';
  static const String ContractsReceivedViewRoute = '/contracts-received-view';
  static const String CreateReviewViewRoute = '/create-review-view';
  static const all = <String>{
    StartupViewRoute,
    WelcomeViewRoute,
    LoginViewRoute,
    SignupViewRoute,
    HomeViewRoute,
    DetailsViewRoute,
    ContractsCreatedViewRoute,
    ContractsReceivedViewRoute,
    CreateReviewViewRoute,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.StartupViewRoute, page: StartupView),
    RouteDef(Routes.WelcomeViewRoute, page: WelcomeView),
    RouteDef(Routes.LoginViewRoute, page: LoginView),
    RouteDef(Routes.SignupViewRoute, page: SignupView),
    RouteDef(Routes.HomeViewRoute, page: HomeView),
    RouteDef(Routes.DetailsViewRoute, page: DetailsView),
    RouteDef(Routes.ContractsCreatedViewRoute, page: ContractsCreatedView),
    RouteDef(Routes.ContractsReceivedViewRoute, page: ContractsReceivedView),
    RouteDef(Routes.CreateReviewViewRoute, page: CreateReviewView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartupView(),
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
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    DetailsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DetailsView(),
        settings: data,
      );
    },
    ContractsCreatedView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ContractsCreatedView(),
        settings: data,
      );
    },
    ContractsReceivedView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ContractsReceivedView(),
        settings: data,
      );
    },
    CreateReviewView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateReviewView(),
        settings: data,
      );
    },
  };
}
