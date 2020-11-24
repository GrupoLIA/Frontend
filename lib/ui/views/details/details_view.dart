import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lia_frontend/app/constants.dart';
import 'package:lia_frontend/ui/views/details/details_viewmodel.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:stacked/stacked.dart';

class DetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    Size size = MediaQuery.of(context).size;

    return ViewModelBuilder.nonReactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: detailsAppBar(model),
        body: Column(
          children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, color: kSecondaryColor),
                          SizedBox(width: 10),
                          Text("Neuquén"),
                        ],
                      ),
                      NameAndRating(args: args),
                      Text(args['profileDescription'],
                          style: TextStyle(height: 1.5)),
                      SizedBox(height: size.height * 0.1),
                      GestureDetector(
                        onTap: () => model.showConfirmationDialog(),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/bag.svg"),
                              SizedBox(width: 10),
                              Text("Contratalo Ya",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18))
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => DetailsViewModel(
          employeeID: args['employeeID'], trade: args['trade']),
    );
  }

  AppBar detailsAppBar(model) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          model.pop();
        },
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset('assets/icons/share.svg'),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/more.svg"),
          onPressed: () {},
        ),
      ],
    );
  }
}

class NameAndRating extends ViewModelWidget<DetailsViewModel> {
  const NameAndRating({
    Key key,
    @required this.args,
  }) : super(key: key);

  final Map<String, dynamic> args;

  @override
  Widget build(BuildContext context, DetailsViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Marcos Daniel Torres",
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(height: 10),
                Row(children: [
                  SmoothStarRating(
                    borderColor: kPrimaryColor,
                    rating: args['totalRating'] / args['reviewCount'],
                    isReadOnly: true,
                  ),
                  SizedBox(width: 10),
                  Text("${args['reviewCount']} reviews"),
                ]),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            height: 100,
            width: 100,
            decoration: BoxDecoration(color: Colors.white),
            child: CircleAvatar(
              backgroundImage: NetworkImage(args['avatar']),
              backgroundColor: Colors.transparent,
            ),
          )
        ],
      ),
    );
  }
}
