import 'package:flutter/material.dart';
import 'package:lia_frontend/app/constants.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewListItem extends StatelessWidget {
  final String id;
  final String contract;
  final String title;
  final String description;
  final dynamic rating;

  const ReviewListItem({
    Key key,
    this.id,
    this.contract,
    this.title,
    this.description,
    this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InnerTile(
        id: id, title: title, description: description, rating: rating);
  }
}

class InnerTile extends StatelessWidget {
  const InnerTile({
    Key key,
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.rating,
  }) : super(key: key);

  final String id;
  final String title;
  final String description;
  final dynamic rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 16,
              color: Colors.grey[400],
            ),
          ],
          borderRadius: BorderRadius.circular(5)),
      child: id == LoadingIndicatorID
          ? CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothStarRating(
                  rating: rating / 1,
                  isReadOnly: true,
                ),
                Text(
                  "$title",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [Text("$description")],
                )
              ],
            ),
      alignment: Alignment.center,
    );
  }
}
