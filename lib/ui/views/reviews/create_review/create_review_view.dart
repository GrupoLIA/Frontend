import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lia_frontend/ui/views/dumb_widgets/rounded_button/rounded_button_widget.dart';
import 'package:lia_frontend/ui/views/reviews/create_review/create_review_viewmodel.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class CreateReviewView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    return ViewModelBuilder.nonReactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Crear review"),
            SmoothStarRating(onRated: (value) {
              model.updateRating(value);
            }),
            ReviewTitle(),
            ReviewDescription(),
            RoundedButton(text: "Crear Review", press: model.createReview),
          ],
        ),
      ),
      viewModelBuilder: () =>
          CreateReviewViewModel(contractID: args['contractID']),
    );
  }
}

class ReviewTitle extends HookViewModelWidget<CreateReviewViewModel> {
  @override
  Widget buildViewModelWidget(
      BuildContext context, CreateReviewViewModel model) {
    var titleController = useTextEditingController();
    return TextField(
      controller: titleController,
      onChanged: model.updateTitle,
      decoration: InputDecoration(hintText: "Title", border: InputBorder.none),
    );
  }
}

class ReviewDescription extends HookViewModelWidget<CreateReviewViewModel> {
  @override
  Widget buildViewModelWidget(
      BuildContext context, CreateReviewViewModel model) {
    var descriptionController = useTextEditingController();
    return TextField(
      controller: descriptionController,
      onChanged: model.updateDescription,
      decoration:
          InputDecoration(hintText: "Description", border: InputBorder.none),
    );
  }
}
