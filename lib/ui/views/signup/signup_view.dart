import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lia_frontend/app/constants.dart';
import 'package:lia_frontend/ui/views/dumb_widgets/already_have_an_account_check/already_have_an_account_check.dart';
import 'package:lia_frontend/ui/views/dumb_widgets/orb_divider/orb_divider.dart';
import 'package:lia_frontend/ui/views/dumb_widgets/rounded_button/rounded_button_widget.dart';
import 'package:lia_frontend/ui/views/dumb_widgets/socal_icon/socal_icon.dart';
import 'package:lia_frontend/ui/views/dumb_widgets/text_field_container/text_field_container_widget.dart';
import 'package:lia_frontend/ui/views/signup/signup_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class SignupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<SignupViewModel>.nonReactive(
      viewModelBuilder: () => SignupViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/signup_top.png",
                  width: size.width * 0.35,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/main_bottom.png",
                  width: size.width * 0.25,
                ),
              ),
              SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("SIGNUP", style: TextStyle(fontWeight: FontWeight.bold)),
                  SvgPicture.asset("assets/icons/signup.svg",
                      height: size.height * 0.35),
                  TextFieldContainer(size: size, child: SignupViewEmailForm()),
                  TextFieldContainer(
                      size: size, child: SignupViewPasswordForm()),
                  RoundedButton(text: "SIGNUP", press: model.submit),
                  AlreadyHaveAnAccountCheck(login: false),
                  OrbDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalIcon(
                          iconSrc: "assets/icons/facebook.svg", press: () {}),
                      SocalIcon(
                          iconSrc: "assets/icons/twitter.svg", press: () {}),
                      SocalIcon(
                          iconSrc: "assets/icons/google-plus.svg",
                          press: () {}),
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupViewEmailForm extends HookViewModelWidget<SignupViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, SignupViewModel model) {
    var emailController = useTextEditingController();
    return TextField(
      controller: emailController,
      onChanged: model.updateEmail,
      decoration: InputDecoration(
          icon: Icon(Icons.person, color: kPrimaryColor),
          hintText: "Tu Email",
          border: InputBorder.none),
    );
  }
}

class SignupViewPasswordForm extends HookViewModelWidget<SignupViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, SignupViewModel model) {
    var passwordController = useTextEditingController();
    return TextField(
      controller: passwordController,
      onChanged: model.updatePassword,
      obscureText: true,
      decoration: InputDecoration(
          icon: Icon(Icons.lock, color: kPrimaryColor),
          hintText: "Contraseña",
          suffixIcon: Icon(Icons.visibility, color: kPrimaryColor),
          border: InputBorder.none),
    );
  }
}
