import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vouloir/config/color_pallete.dart';
import 'package:vouloir/pages/my_article_screen/view/profile/profileabout.dart';

class MyArticleSingleViewPropList extends StatelessWidget {
  const MyArticleSingleViewPropList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 39.0,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(
              height: 18,
            ),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) => propListCard(context),
          )
        ],
      ),
    );
  }

  Stack propListCard(context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          height: 272,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0), color: Colors.white),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(19.0, 7.94, 19, 11),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        // CircleAvatar(
                        //   child: SvgPicture.asset(

                        //     'assets/hasnain.svg'),
                        // ),
                        Container(
                          height: 40.0,
                          width: 42.29,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/hasnain.png'),
                                fit: BoxFit.fill),
                          ),
                          // child: SvgPicture.asset(
                          //   'assets/summayya.svg',
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                        SvgPicture.asset('assets/certifiedcheck.svg')
                      ],
                    ),
                    const SizedBox(
                      width: 11.0,
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, "/ProfileAbout"),
                      child: Text(
                        "Hasnain",
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Raleway",
                          fontSize: 14.0,
                        ),
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 9.77,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Expected Delivery:  ",
                        style: TextStyle(
                          color: secColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Raleway",
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        "11/02/2022",
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Raleway",
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    height: 130,
                    child: Text(
                      "We require a Google ads PPC marketing expert to create remarketing ads and PPC ads specifically for  Google.ca.  You must show that CTR and sales conversions for ads as well as describe the CAC for each new sale on the campaigns that you've worked on.",
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Raleway",
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  //Cards Button
                  Padding(
                    padding: const EdgeInsets.only(left: 1.0, right: 05.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: primaryColor),
                            alignment: Alignment.center,
                            height: 37,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    'assets/chat_my_article_view.svg'),
                                const SizedBox(
                                  width: 9.0,
                                ),
                                const Text(
                                  "Chat",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Raleway",
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: primaryColor),
                            alignment: Alignment.center,
                            height: 37,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/discard.svg'),
                                const SizedBox(
                                  width: 9.0,
                                ),
                                const Text(
                                  "Discard",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Raleway",
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              height: 28,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16.0),
                  ),
                  color: cardColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/gift.svg'),
                  Text(
                    "Giveaway",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Raleway",
                      fontSize: 10.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
