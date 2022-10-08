import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vouloir/config/color_pallete.dart';
import 'package:vouloir/config/textstyle.dart';

class ReviewTab extends StatelessWidget {
  ReviewTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReviewCard reviewContent = ReviewCard(
        title: "Google Ads and PPC Marketing Expert",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
        rating: 3);
    return ListView.separated(
        separatorBuilder: (context, index) => Column(
              children: [
                Divider(
                  height: 1.0,
                  color: textColor.withOpacity(0.2),
                ),
                const SizedBox(
                  height: 24,
                )
              ],
            ),
        itemCount: 5,
        itemBuilder: (context, index) => reviews(reviewContent));
  }

  Padding reviews(ReviewCard reviewContent) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            reviewContent.title,
            style: ralewayStyle(18, FontWeight.w600, textColor),
          ),
          const SizedBox(
            height: 16.0,
          ),
          RatingBar.builder(
            initialRating: reviewContent.rating.toDouble(),
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 24,
            itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          const SizedBox(height: 22),
          Text(
            reviewContent.description,
            style: ralewayStyle(12, FontWeight.w500, textColor),
          ),
          const SizedBox(
            height: 26,
          ),
        ],
      ),
    );
  }
}

class ReviewCard {
  String title;
  int rating;
  String description;
  ReviewCard(
      {required this.title, required this.description, required this.rating});
}
