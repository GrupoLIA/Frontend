import 'package:flutter/material.dart';
import 'package:lia_frontend/ui/views/details/details_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    return ViewModelBuilder.nonReactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("${args['email']}"),
        ),
        body: Center(
          child: Text("${args['profileDescription']}"),
        ),
      ),
      viewModelBuilder: () => DetailsViewModel(),
    );
  }
}
