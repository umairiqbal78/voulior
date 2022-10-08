import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vouloir/config/textstyle.dart';

import '../../../../config/color_pallete.dart';

class BasicSubscription extends StatefulWidget {
  const BasicSubscription({
    Key? key,
  }) : super(key: key);

  @override
  State<BasicSubscription> createState() => _BasicSubscriptionState();
}

class _BasicSubscriptionState extends State<BasicSubscription> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.68,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.63,
              child: PageView(
                  padEnds: false,
                  controller: _pageController,
                  children: [
                    propCard(context, "monthly", "9.98"),
                    propCard(context, "yearly", "8.98"),
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 2,
                    effect: WormEffect(
                        dotColor: cardColor, activeDotColor: textColor),
                    onDotClicked: (index) => _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Padding propCard(BuildContext context, String duration, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.65,
        decoration: BoxDecoration(
            border: Border.all(color: secColor.withOpacity(0.1)),
            color: cardColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(7.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 20.0),
          child: Container(
            alignment: Alignment.topCenter,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 0.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.56,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(130, 115, 151, 0.94),
                              Color.fromRGBO(130, 115, 151, 0.89),
                            ])),
                    padding: const EdgeInsets.only(top: 39, left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.10),
                          child: Text(
                            "Basic ($duration)",
                            style:
                                ralewayStyle(24, FontWeight.w600, Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.18),
                          child: Text(
                            "\$$price",
                            style: ralewayStyle(32, FontWeight.w600, cardColor),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              "All from Neutral",
                              style: ralewayStyle(
                                  16, FontWeight.w500, Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              "30 more props",
                              style: ralewayStyle(
                                  16, FontWeight.w500, Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Lorem ipsum",
                              style: ralewayStyle(
                                  16, FontWeight.w500, Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    alignment: Alignment.center,
                    height: 48.0,
                    width: MediaQuery.of(context).size.width * 0.60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48.0),
                      color: primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color:
                              primaryColor.withOpacity(0.5), //color of shadow
                          spreadRadius: 5, //spread radius
                          blurRadius: 7, // blur radius
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      "Select this plan",
                      style: ralewayStyle(16, FontWeight.w600, Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
