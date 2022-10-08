import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vouloir/config/color_pallete.dart';
import 'package:vouloir/config/textstyle.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: ralewayStyle(16, FontWeight.w900, Colors.black),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "User Interface Designer is about how a product that is created looks like what can be seen by the eye. The main purpose of the UI itself is to display an interface that has uniformity in terms of color, layout, or font. The main purpose of the UI itself is to display an interface that has uniformity in terms of color, layout, or font.",
            style: ralewayStyle(14, FontWeight.w400, textColor),
          ),
          const SizedBox(
            height: 28,
          ),
          Text(
            "Ratings",
            style: ralewayStyle(16, FontWeight.w900, Colors.black),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: RatingBar.builder(
                  initialRating: 3,
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
              ),
              Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "4.93 of 61 reviews",
                        style: ralewayStyle(12, FontWeight.w600, textColor),
                      )))
            ],
          ),
        ],
      ),
    );
  }
}
