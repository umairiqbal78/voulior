import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:vouloir/config/color_pallete.dart';

class MyArticlesCardView extends StatefulWidget {
  const MyArticlesCardView(
      {Key? key,
      required this.title,
      required this.category,
      required this.description,
      required this.tags})
      : super(key: key);
  final String title;
  final String category;
  final String description;
  final List<String> tags;
  @override
  State<MyArticlesCardView> createState() => _MyArticlesCardViewState();
}

class _MyArticlesCardViewState extends State<MyArticlesCardView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Material(
          color: secColor.withOpacity(0.08),
          elevation: 0.0,
          borderRadius: BorderRadius.circular(24.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 13.0),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Title
                    Text(widget.title,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w900,
                          fontSize: 14.0,
                          color: textColor,
                        )),
                    //Category Marketing
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0, bottom: 11),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                                text: "Category:",
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: secColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                                children: [
                                  TextSpan(
                                    text: "  ${widget.category}",
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        color: textColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    ReadMoreText(
                      widget.description,
                      style: TextStyle(
                          height: 1.5,
                          color: textColor,
                          fontFamily: 'Raleway',
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      trimLines: 3,
                      colorClickableText: Colors.grey,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' more',
                      trimExpandedText: ' less',
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 26,
                      ),
                      child: Container(
                        height: 30.0,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.tags.length,
                          itemBuilder: ((context, index) => Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: cardColor,
                                      borderRadius: BorderRadius.circular(32)),
                                  height: 24,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        12.0, 4.0, 12.0, 4.0),
                                    child: Text(
                                      widget.tags[index],
                                      style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
