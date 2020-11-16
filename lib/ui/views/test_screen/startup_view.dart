import 'package:flutter/material.dart';
import 'package:lia_frontend/ui/views/home/home_view.dart';
import 'package:lia_frontend/ui/views/test_screen/startup_viewmodel.dart';
import 'package:lia_frontend/ui/views/welcome/welcome_view.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        builder: (context, model, child) {
          return model.isBusy
              ? Scaffold(body: Center(child: CircularProgressIndicator()))
              : model.data != null
                  ? HomeView()
                  : WelcomeView();
        },
        viewModelBuilder: () => StartupViewModel());
  }
}
