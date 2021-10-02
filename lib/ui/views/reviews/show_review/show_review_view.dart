import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lia_frontend/ui/views/dumb_widgets/review_list_item/review_list_item.dart';
import 'package:lia_frontend/ui/views/reviews/show_review/show_review_viewmodel.dart';
import 'package:lia_frontend/ui/views/smart_widgets/creation_aware_list_item/creation_aware_list_item.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:stacked/stacked.dart';

class ShowReviewView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Reviews recibidas"),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          model.isBusy || model.data == null
              ? CircularProgressIndicator()
              : Expanded(
                  child: ListView.builder(
                    itemCount: model.items.length,
                    itemBuilder: (context, index) => ReviewListItem(
                      id: model.items[index].id,
                      contract: model.items[index].contract,
                      title: model.items[index].title,
                      description: model.items[index].description,
                      rating: model.items[index].rating,
                    ),
                  ),
                ),
        ]),
      ),
      viewModelBuilder: () => ShowReviewViewModel(),
    );
  }
}
