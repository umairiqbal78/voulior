import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vouloir/Routes/app_pages.dart';
import 'package:vouloir/config/bottom_nav_bar.dart';
import 'package:vouloir/config/drawer.dart';
import 'package:vouloir/pages/home/widgets/filter_bottom_sheet.dart';
import 'package:vouloir/pages/home/widgets/search_field.dart';
import 'package:vouloir/pages/my_article_screen/widgets/my_article_card.dart';
import 'package:vouloir/pages/my_article_screen/widgets/my_article_filter_bottom_sheet.dart';
import 'package:vouloir/pages/my_article_screen/widgets/scrollview_my_article_cards.dart';

import '../../../config/color_pallete.dart';

class MyArticleScreen extends StatefulWidget {
  const MyArticleScreen({Key? key}) : super(key: key);

  @override
  State<MyArticleScreen> createState() => _MyArticleScreenState();
}

class _MyArticleScreenState extends State<MyArticleScreen> {
  appBarLeadingButtton() {}
  List<String> tagsList = [
    "PPC",
    "Google Ads",
    "Marketing",
  ];

  /// myArtile Single view
  final scrollController = ScrollController();
  List<MyArticlesCardView> cards = List.generate(
      12,
      (index) => const MyArticlesCardView(
            title: "Google Ads and PPC Marketing Expert",
            category: "Marketing",
            description:
                "We require a Google ads PPC marketing expert to create remarketing ads and PPC ads specifically for  Google.ca.  You must show that CTR and sales...",
            tags: <String>[
              "PPC",
              "Google Ads",
              "Marketing",
            ],
          ));

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        fetch();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future fetch() async {
    setState(() {
      cards.add(const MyArticlesCardView(
        title: "Google Ads and PPC Marketing Expert after loading",
        category: "Marketing",
        description:
            "We require a Google ads PPC marketing expert to create remarketing ads and PPC ads specifically for  Google.ca.  You must show that CTR and sales...",
        tags: <String>[
          "PPC",
          "Google Ads",
          "Marketing",
        ],
      ));
    });
  }

  Future refreshScrollView() async {
    setState(() {
      fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        extendBody: true,

        backgroundColor: const Color.fromRGBO(245, 245, 245, 1.0),
        appBar: appBarWidget(),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //Search Field
              const Padding(
                  padding: EdgeInsets.fromLTRB(24, 32.0, 24, 24),
                  child: SearchField()),
              //Scrollable Card View
              Flexible(
                child: RefreshIndicator(
                  color: secColor,
                  onRefresh: refreshScrollView,
                  child: ListView.builder(
                    controller: scrollController,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cards.length + 1,
                    itemBuilder: (context, index) {
                      if (index < cards.length) {
                        final card = cards[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 24),
                          child: GestureDetector(
                            onTap: () =>
                                Get.toNamed(Routes.myArticleSingleViewScreen),
                            child: MyArticlesCardView(
                                title: card.title,
                                category: card.category,
                                description: card.description,
                                tags: card.tags),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: secColor,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        // bottomNavigationBar: const CustomBottomNavigationBar(
        //   selectedIndex: 0,
        // ),
      ),
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      // leading: Container(
      //   height: 40,
      //   width: 40,
      //   alignment: Alignment.center,
      //   margin: const EdgeInsets.only(left: 24.0),
      //   decoration:
      //       const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      //   child: IconButton(
      //       iconSize: 40,
      //       alignment: Alignment.center,
      //       onPressed: () {
      //         scaffoldKey.currentState!.openDrawer();
      //       },
      //       icon: Padding(
      //         padding: const EdgeInsets.fromLTRB(0, 08, 12, 08),
      //         child: Icon(
      //           Icons.person,
      //           color: secColor,
      //           size: 18,
      //         ),
      //       )),
      // ),
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 6.0, 0.0, 6.0),
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              Icons.arrow_back,
              color: secColor,
              size: 20,
            ),
          ),
        ),
      ),

      title: const Text(
        "My Articles",
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 08.0, 12.0, 6.0),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                constraints: BoxConstraints.tight(Size(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height * .90)),
                isScrollControlled: true,
                isDismissible: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(23),
                  ),
                ),
                context: context,
                builder: (context) => const MyArticleFilterBottomSheet(),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                right: 5.0,
                bottom: 10.0,
              ),
              child: Container(
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.14),
                        spreadRadius: 0.2,
                        blurRadius: 1,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(100),
                    color: secColor,
                  ),
                  child: SvgPicture.asset(
                    'assets/filter.svg',
                    color: Colors.white,
                  )),
            ),
          ),
        )
      ],
    );
  }
}
