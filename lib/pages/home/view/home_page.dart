import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:vouloir/Routes/app_pages.dart';
import 'package:vouloir/config/bottom_nav_bar.dart';
import 'package:vouloir/config/custom_bottom_nav_bar.dart';
import 'package:vouloir/config/drawer.dart';
import 'package:vouloir/pages/home/model/home_page_model.dart';
import 'package:vouloir/pages/home/widgets/article_card.dart';
import 'package:vouloir/pages/home/widgets/filter_bottom_sheet.dart';
import 'package:vouloir/pages/home/widgets/scrollview_article_cards.dart';
import 'package:vouloir/pages/home/widgets/search_field.dart';

import '../../../config/color_pallete.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tagsList = [
    "PPC",
    "Google Ads",
    "Marketing",
    "PPC",
    "Google Ads",
    "Marketing"
  ];

  ///Home Cards Scrolling features
  final scrollController = ScrollController();
  List<ArticlesCardWidget> cards = List.generate(
      12,
      (index) => const ArticlesCardWidget(
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
      cards.add(const ArticlesCardWidget(
        title: "Google Ads and PPC Marketing Expert after loading",
        category: "Marketing",
        description:
            "We require a Google ads PPC marketing expert to create remarketing ads and PPC ads specifically for  Google.ca.  You must show that CTR and sales...",
        tags: <String>[
          "PPC",
          "Google Ads",
          "Marketing",
          "PPC",
          "Google Ads",
          "Marketing"
        ],
      ));
    });
  }

  Future refreshScrollView() async {
    setState(() {
      fetch();
    });
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        extendBody: true,
        key: scaffoldKey,
        drawerScrimColor: Colors.transparent,
        drawer: const DrawerWidget(),
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
                                Get.toNamed(Routes.articleDetailViewScreen),
                            child: ArticlesCardWidget(
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
    final homePageModel = context.watch<HomePageModel>();
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(24, 6.0, 0.0, 6.0),
        child: GestureDetector(
          onTap: () {
            scaffoldKey.currentState!.openDrawer();
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              Icons.person,
              color: secColor,
              size: 18,
            ),
          ),
        ),
      ),
      title: const Text(
        "Home",
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
              homePageModel.changeFilterContainerColor();
              homePageModel.changeFilterIconColor();
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
                builder: (context) => ChangeNotifierProvider(
                  create: (_) => HomePageModel(),
                  // ignore: prefer_const_literals_to_create_immutables
                  child: const FilterBottomSheet(),
                ),
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
                    color: homePageModel.getContainerColor,
                  ),
                  child: SvgPicture.asset(
                    'assets/filter.svg',
                    color: homePageModel.getIconColor,
                  )),
            ),
          ),
        )
      ],
    );
  }
}
