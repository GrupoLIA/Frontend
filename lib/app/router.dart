import 'package:auto_route/auto_route_annotations.dart';
import 'package:lia_frontend/ui/views/home/home_view.dart';
import 'package:lia_frontend/ui/views/login/login_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: HomeView, name: "HomeViewRoute"),
    MaterialRoute(page: LoginView, name: "LoginViewRoute", initial: true)
  ],
)
class $Router {}
