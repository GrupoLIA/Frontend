import 'package:auto_route/auto_route_annotations.dart';
import 'package:lia_frontend/ui/views/details/details_view.dart';
import 'package:lia_frontend/ui/views/home/home_view.dart';
import 'package:lia_frontend/ui/views/login/login_view.dart';
import 'package:lia_frontend/ui/views/signup/signup_view.dart';
import 'package:lia_frontend/ui/views/startup/startup_view.dart';
import 'package:lia_frontend/ui/views/welcome/welcome_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: StartupView, name: "StartupViewRoute", initial: true),
    MaterialRoute(page: WelcomeView, name: "WelcomeViewRoute"),
    MaterialRoute(page: LoginView, name: "LoginViewRoute"),
    MaterialRoute(page: SignupView, name: "SignupViewRoute"),
    MaterialRoute(page: HomeView, name: "HomeViewRoute"),
    MaterialRoute(page: DetailsView, name: "DetailsViewRoute"),
  ],
)
class $Router {}
