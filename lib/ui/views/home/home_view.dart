import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lia_frontend/app/constants.dart';
import 'package:lia_frontend/ui/views/dumb_widgets/home_appbar/home_appbar_widget.dart';
import 'package:lia_frontend/ui/views/dumb_widgets/list_item/list_item.dart';
import 'package:lia_frontend/ui/views/home/home_viewmodel.dart';
import 'package:lia_frontend/ui/views/smart_widgets/creation_aware_list_item/creation_aware_list_item.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: homeAppBar(context),
        body: Column(
          children: [
            SearchBox(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryItem(title: "Gasista"),
                  CategoryItem(title: "Jardinero"),
                  CategoryItem(title: "Pintor"),
                  CategoryItem(title: "Plomero"),
                  CategoryItem(title: "Mecanico"),
                  CategoryItem(title: "Cocinero"),
                ],
              ),
            ),
            model.isBusy
                ? Expanded(child: Center(child: CircularProgressIndicator()))
                : Expanded(
                    child: ScrollablePositionedList.builder(
                      itemScrollController: model.itemScrollController,
                      itemCount: model.items.length,
                      itemBuilder: (context, index) => CreationAwareListItem(
                        itemCreated: () {
                          SchedulerBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            model.handleItemCreated(index);
                          });
                        },
                        child: ListItem(
                          id: model.items[index].id,
                          email: model.items[index].email,
                          profileDescription:
                              model.items[index].profileDescription,
                          avatar: model.items[index].avatar,
                          totalRating: model.getTotalRating(index),
                          reviewCount: model.getReviewCount(index),
                          onTapFunction: model.navigateToDetails,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class CategoryItem extends ViewModelWidget<HomeViewModel> {
  final String title;

  CategoryItem({
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        model.changeActiveCategory(this.title);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Text(
              title,
              style: model.activeIndex == this.title
                  ? TextStyle(color: kTextColor, fontWeight: FontWeight.bold)
                  : TextStyle(fontSize: 12),
            ),
            if (model.activeIndex == this.title)
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 3,
                width: 22,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class SearchBox extends ViewModelWidget<HomeViewModel> {
  //TODO: Add a textfield controller most likely
  const SearchBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: kSecondaryColor.withOpacity(0.32))),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: SvgPicture.asset("assets/icons/search.svg"),
            hintText: "Search Here",
            hintStyle: TextStyle(color: kSecondaryColor)),
      ),
    );
  }
}
