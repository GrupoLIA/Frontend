import 'package:flutter/material.dart';
import 'package:lia_frontend/app/constants.dart';

class UserListItem extends StatelessWidget {
  final String id;
  final String email;
  final String profileDescription;
  final String avatar;
  final int reviewCount;
  final int totalRating;
  final Function onTapFunction;

  const UserListItem(
      {Key key,
      this.id,
      this.email,
      this.profileDescription,
      this.avatar,
      this.onTapFunction,
      this.reviewCount,
      this.totalRating});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        await onTapFunction(
            id, email, profileDescription, avatar, reviewCount, totalRating);
      },
      child: Container(
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
        child: email == LoadingIndicatorEmail
            ? CircularProgressIndicator()
            : Text(email),
        alignment: Alignment.center,
      ),
    );
  }
}
