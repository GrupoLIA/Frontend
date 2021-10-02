import 'package:auto_route/auto_route_annotations.dart';
import 'package:lia_frontend/ui/views/contracts/contracts_created/contracts_created_view.dart';
import 'package:lia_frontend/ui/views/contracts/contracts_received/contracts_received_view.dart';
import 'package:lia_frontend/ui/views/details/details_view.dart';
import 'package:lia_frontend/ui/views/home/home_view.dart';
import 'package:lia_frontend/ui/views/login/login_view.dart';
import 'package:lia_frontend/ui/views/reviews/create_review/create_review_view.dart';
import 'package:lia_frontend/ui/views/signup/signup_view.dart';
import 'package:lia_frontend/ui/views/startup/startup_view.dart';
import 'package:lia_frontend/ui/views/welcome/welcome_view.dart';
import 'package:lia_frontend/ui/views/reviews/show_review/show_review_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: StartupView, name: "StartupViewRoute", initial: true),
    MaterialRoute(page: WelcomeView, name: "WelcomeViewRoute"),
    MaterialRoute(page: LoginView, name: "LoginViewRoute"),
    MaterialRoute(page: SignupView, name: "SignupViewRoute"),
    MaterialRoute(page: HomeView, name: "HomeViewRoute"),
    MaterialRoute(page: DetailsView, name: "DetailsViewRoute"),
    MaterialRoute(
        page: ContractsCreatedView, name: "ContractsCreatedViewRoute"),
    MaterialRoute(
        page: ContractsReceivedView, name: "ContractsReceivedViewRoute"),
    MaterialRoute(page: CreateReviewView, name: "CreateReviewViewRoute"),
    MaterialRoute(page: ShowReviewView, name: "ShowReviewViewRoute"),
  ],
)
class $Router {}
