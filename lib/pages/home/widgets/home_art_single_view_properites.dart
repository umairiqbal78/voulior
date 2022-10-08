import 'package:flutter/material.dart';

import '../../../config/color_pallete.dart';

class HomeArticleSingleViewProperties extends StatelessWidget {
  HomeArticleSingleViewProperties({Key? key}) : super(key: key);
  final String textDetails =
      "We require a Google ads PPC marketing expert to create remarketing ads and PPC ads specifically for  Google.ca.  You must show that CTR and sales conversions for ads as well as describe the CAC for each new sale on the campaigns that you've worked on.";

  final List<String> tagTitle = [
    "PPC",
    "Google Ads",
    "Marketing",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //First Section
        firstSectionOfPropertiesView("Category", "Marketing"),
        const SizedBox(height: 12.0),
        firstSectionOfPropertiesView("Sub Category", "-"),
        const SizedBox(height: 12.0),
        firstSectionOfPropertiesView("Quantity", "4"),
        const SizedBox(height: 12.0),
        firstSectionOfPropertiesView("Quantity Unit", "-"),
        const SizedBox(height: 12.0),
        Divider(
          color: textColor.withOpacity(0.2),
          height: 1.0,
          thickness: 1.0,
        ),
        //Article Details
        Container(
            height: 140,
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              textDetails,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontFamily: "Raleway",
                fontSize: 14.0,
              ),
            )),
        //Article Details Tags
        Container(
          height: 26,
          width: double.infinity,
          child: ListView.separated(
            separatorBuilder: ((context, index) => const SizedBox(width: 8.0)),
            scrollDirection: Axis.horizontal,
            itemCount: tagTitle.length,
            itemBuilder: (context, index) => tagChip(tagTitle[index]),
          ),
        ),
        const SizedBox(height: 17.0),
        Divider(
          color: textColor.withOpacity(0.2),
          height: 1.0,
          thickness: 1.0,
        ),
        //Attachment Section
        const SizedBox(height: 12.0),

        Text(
          "Attachements (4)",
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontFamily: "Raleway",
            fontSize: 16.0,
          ),
        ),
        const SizedBox(
          height: 26.0,
        ),
        //attachment row#1
        Row(
          children: [
            Expanded(
                child: Row(
              children: [
                Icon(
                  Icons.attach_file_rounded,
                  color: primaryColor,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                const Text(
                  "Loremipsum.png",
                  style: TextStyle(
                    color: Color.fromRGBO(30, 212, 0, 1),
                    fontWeight: FontWeight.w600,
                    fontFamily: "Raleway",
                    fontSize: 14.0,
                  ),
                )
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Icon(
                  Icons.attach_file_rounded,
                  color: primaryColor,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                const Text(
                  "Loremipsum.png",
                  style: TextStyle(
                    color: Color.fromRGBO(30, 212, 0, 1),
                    fontWeight: FontWeight.w600,
                    fontFamily: "Raleway",
                    fontSize: 14.0,
                  ),
                )
              ],
            )),
          ],
        ),
        const SizedBox(height: 18.0),
        //attachment row 2
        Row(
          children: [
            Expanded(
                child: Row(
              children: [
                Icon(
                  Icons.attach_file_rounded,
                  color: primaryColor,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                const Text(
                  "Loremipsum.png",
                  style: TextStyle(
                    color: Color.fromRGBO(30, 212, 0, 1),
                    fontWeight: FontWeight.w600,
                    fontFamily: "Raleway",
                    fontSize: 14.0,
                  ),
                )
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Icon(
                  Icons.attach_file_rounded,
                  color: primaryColor,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                const Text(
                  "Loremipsum.png",
                  style: TextStyle(
                    color: Color.fromRGBO(30, 212, 0, 1),
                    fontWeight: FontWeight.w600,
                    fontFamily: "Raleway",
                    fontSize: 14.0,
                  ),
                )
              ],
            )),
          ],
        )
      ],
    );
  }

  Container tagChip(String tagTitle) {
    return Container(
      height: 24,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Text(
        tagTitle,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w400,
          fontFamily: "Raleway",
          fontSize: 14.0,
        ),
      ),
    );
  }

  Row firstSectionOfPropertiesView(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "$title:",
          style: TextStyle(
              color: secColor,
              fontWeight: FontWeight.w600,
              fontFamily: "Raleway",
              fontSize: 14.0),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          value,
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontFamily: "Raleway",
              fontSize: 14.0),
        ),
      ],
    );
  }
}
