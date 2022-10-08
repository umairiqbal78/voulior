import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vouloir/config/color_pallete.dart';
import 'package:vouloir/config/textstyle.dart';

AppBar appBarMethodWidget(
  String title,
  IconData iconName,
  Function onPressed,
) {
  return AppBar(
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8.0, 0.0, 8.0),
        child: GestureDetector(
          onTap: () {
            onPressed;
          },
          child: Container(
            alignment: Alignment.center,
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              iconName,
              color: secColor,
              size: 18,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Raleway',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ));
}

AppBar appBarwithLeading(BuildContext context, String title) {
  return AppBar(
      elevation: 0,
      leadingWidth: 40,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Padding(
          padding: const EdgeInsets.only(
            top: 4.0,
            bottom: 4.0,
            left: 8.0,
          ),
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
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Raleway',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ));
}

AppBar appBarWithDrawerWidget(String title, dynamic scaffoldKey) {
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
    title: Text(
      title,
      style: const TextStyle(
        fontFamily: 'Raleway',
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
