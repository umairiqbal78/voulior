import 'package:flutter/material.dart';
import 'package:vouloir/config/app_bar.dart';
import 'package:vouloir/pages/my_article_screen/widgets/My_art_single_view_properites.dart';
import 'package:vouloir/pages/my_article_screen/widgets/my_art_single_view_prop_list.dart';

import '../../../config/color_pallete.dart';

class MyArticleSingleViewScreen extends StatefulWidget {
  const MyArticleSingleViewScreen({Key? key}) : super(key: key);

  @override
  State<MyArticleSingleViewScreen> createState() =>
      _MyArticleSingleViewScreenState();
}

class _MyArticleSingleViewScreenState extends State<MyArticleSingleViewScreen> {
  bool viewProperties = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarwithLeading(context, "Details"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Google Ads and PPC Marketing Expert",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: "Raleway",
                    fontSize: 18.0),
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                color: textColor.withOpacity(0.2),
                height: 1.0,
                thickness: 1.0,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                height: 48.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                        color: const Color.fromRGBO(220, 223, 227, 1))),
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          viewProperties = true;
                        });
                        print("tap");
                      },
                      child: Container(
                        height: 32,
                        decoration: viewProperties
                            ? BoxDecoration(
                                color: secColor,
                                borderRadius: BorderRadius.circular(32.0))
                            : BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(32.0)),
                        alignment: Alignment.center,
                        child: Text(
                          "View Properties",
                          style: viewProperties
                              ? const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Raleway",
                                  fontSize: 12.0)
                              : TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Raleway",
                                  fontSize: 12.0),
                        ),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          viewProperties = false;
                        });
                      },
                      child: Container(
                        height: 32,
                        decoration: viewProperties
                            ? BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(32.0))
                            : BoxDecoration(
                                color: secColor,
                                borderRadius: BorderRadius.circular(32.0)),
                        alignment: Alignment.center,
                        child: Text(
                          "Props List",
                          style: viewProperties
                              ? TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Raleway",
                                  fontSize: 12.0)
                              : const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Raleway",
                                  fontSize: 12.0),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              const SizedBox(
                height: 17.0,
              ),
              //
              viewProperties
                  ? MyArticleSingleViewProperites()
                  : const MyArticleSingleViewPropList(),

              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
