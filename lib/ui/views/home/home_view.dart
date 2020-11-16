import 'package:flutter/material.dart';
import 'package:lia_frontend/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Home View"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(model.getUserProfile()),
            RaisedButton(
              onPressed: () => {model.logoutUser()},
              child: Text("Logout"),
            )
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
