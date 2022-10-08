import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vouloir/config/app_bar.dart';
import 'package:vouloir/config/color_pallete.dart';
import 'package:vouloir/config/drawer.dart';
import 'package:vouloir/config/textstyle.dart';
import 'package:vouloir/pages/my_article_screen/view/profile/abouttab.dart';
import 'package:vouloir/pages/my_article_screen/view/profile/reviewtab.dart';

class ProfileAbout extends StatelessWidget {
  ProfileAbout({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          extendBody: true,
          key: scaffoldKey,
          drawerScrimColor: Colors.transparent,
          drawer: const DrawerWidget(),
          backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(270),
              child: Column(
                children: [
                  appBarWithDrawerWidget("Profile", scaffoldKey),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                              'assets/hasnain_profile_screen.png',
                            ))),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.topLeft,
                            height: 90,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Hasnain",
                                    style: ralewayStyle(
                                      20.0,
                                      FontWeight.w600,
                                      neutral,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 9.0,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/Pin.svg'),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      Text(
                                        "Karachi, Pakistan",
                                        style: ralewayStyle(
                                          12,
                                          FontWeight.w500,
                                          profileSubtitle,
                                        ),
                                      )
                                    ],
                                  )
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        border:
                            Border.all(color: neutrals_softgrey, width: 1.0),
                      ),
                      child: TabBar(
                          indicatorPadding: const EdgeInsets.all(0),
                          indicator: BoxDecoration(
                            border: Border.all(color: secColor),
                            borderRadius: BorderRadius.circular(32),
                            color: secColor,
                          ),
                          unselectedLabelColor: neutral,
                          unselectedLabelStyle: const TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w600),
                          labelColor: Colors.white,
                          labelStyle: const TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w600),
                          tabs: const [
                            Tab(
                              text: "About",
                            ),
                            Tab(
                              text: "Review",
                            ),
                          ]),
                    ),
                  ),
                ],
              )),
          body: TabBarView(
              physics:
                  const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              children: [const AboutTab(), ReviewTab()]),
        ));
  }
}
