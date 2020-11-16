import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lia_frontend/ui/views/dumb_widgets/rounded_button/rounded_button_widget.dart';
import 'package:lia_frontend/ui/views/login/login_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Login View"),
        ),
        body: _LoginForm(),
      ),
    );
  }
}

class _LoginForm extends HookViewModelWidget<LoginViewModel> {
  _LoginForm({Key key}) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(BuildContext context, LoginViewModel model) {
    var emailController = useTextEditingController();
    var passwordController = useTextEditingController();
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(controller: emailController, onChanged: model.updateEmail),
        TextField(
          controller: passwordController,
          onChanged: model.updatePassword,
          obscureText: true,
        ),
        RoundedButton(text: "SUBMIT", press: model.submit),
      ],
    );
  }
}
