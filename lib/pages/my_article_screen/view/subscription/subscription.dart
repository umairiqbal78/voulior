import 'package:flutter/material.dart';
import 'package:vouloir/config/app_bar.dart';
import 'package:vouloir/config/color_pallete.dart';
import 'package:vouloir/config/textstyle.dart';
import 'package:vouloir/pages/my_article_screen/view/subscription/basicSubscription.dart';
import 'package:vouloir/pages/my_article_screen/view/subscription/neutralSubscription.dart';
import 'package:vouloir/pages/my_article_screen/view/subscription/sublimeSubscription.dart';

import '../../../../config/drawer.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          key: scaffoldKey,
          drawer: const DrawerWidget(),
          backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight * 2.8),
              child: Column(
                children: [
                  appBarwithLeading(context, "Subscripton"),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 20.0),
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 08.0, vertical: 08.0),
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
                              fontSize: 12.0, fontWeight: FontWeight.w600),
                          labelColor: Colors.white,
                          labelStyle: const TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.w600),
                          tabs: const [
                            Tab(
                              text: "Neutral",
                            ),
                            Tab(
                              text: "Basic",
                            ),
                            Tab(
                              text: "Sublime",
                            ),
                          ]),
                    ),
                  ),
                ],
              )),
          body: const TabBarView(
              physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              children: [
                NeutralSubscription(),
                BasicSubscription(),
                SublimeSubscription(),
              ]),
        ));
  }

  appBarWithDrawer() {
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
        "Subscription ",
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      // actions: [
      //   Padding(
      //       padding: const EdgeInsets.fromLTRB(0.0, 08.0, 12.0, 6.0),
      //       child: TextButton(
      //           onPressed: () {},
      //           child: Text(
      //             "Save",
      //             style: ralewayStyle(14, FontWeight.w500, secColor),
      //           )))
      // ],
    );
  }
}
