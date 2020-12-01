import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lia_frontend/app/constants.dart';
import 'package:lia_frontend/ui/views/dumb_widgets/already_have_an_account_check/already_have_an_account_check.dart';
import 'package:lia_frontend/ui/views/dumb_widgets/rounded_button/rounded_button_widget.dart';
import 'package:lia_frontend/ui/views/dumb_widgets/text_field_container/text_field_container_widget.dart';
import 'package:lia_frontend/ui/views/login/login_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/main_top.png",
                  width: size.width * 0.35,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/login_bottom.png",
                  width: size.width * 0.4,
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("LOGIN",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    SvgPicture.asset(
                      "assets/icons/login.svg",
                      height: size.height * 0.35,
                    ),
                    TextFieldContainer(size: size, child: LoginViewEmailForm()),
                    TextFieldContainer(
                        size: size, child: LoginViewPasswordForm()),
                    RoundedButton(text: "LOGIN", press: model.submit),
                    AlreadyHaveAnAccountCheck()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginViewEmailForm extends HookViewModelWidget<LoginViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, LoginViewModel model) {
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

class LoginViewPasswordForm extends HookViewModelWidget<LoginViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, LoginViewModel model) {
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
