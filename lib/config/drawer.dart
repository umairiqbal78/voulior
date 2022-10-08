import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vouloir/Routes/app_pages.dart';
import 'package:vouloir/config/bottom_nav_bar.dart';
import 'package:vouloir/config/color_pallete.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 0.0,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 60.0,
                  color: const Color.fromRGBO(54, 48, 98, 1),
                ),
                DrawerHeader(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.transparent,
                          width: 0.0,
                          style: BorderStyle.none)),
                  padding: const EdgeInsets.all(0.0),
                  margin: const EdgeInsets.only(bottom: 50.0, top: 0.0),
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: drawerClipper(),
                        child: Container(
                          alignment: Alignment.topCenter,
                          margin: const EdgeInsets.all(0.0),
                          padding: const EdgeInsets.all(0.0),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(54, 48, 98, 1),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(
                                    54, 48, 98, 1), //color of shadow
                                spreadRadius: 2, //spread radius
                                blurRadius: 4, // blur radius
                                offset:
                                    Offset(0, 0), // changes position of shadow
                                //first paramerter of offset is left-right
                                //second parameter is top to down
                              ),
                            ],
                          ),
                        ),
                      ),
                      //first circle
                      Positioned(
                        left: -30,
                        top: 0,
                        child: Container(
                          height: 76.23,
                          width: 76.23,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(
                                    152, 137, 164, 1), //color of shadow
                                spreadRadius: 2, //spread radius
                                blurRadius: 4, // blur radius
                                offset:
                                    Offset(0, 0), // changes position of shadow
                                //first paramerter of offset is left-right
                                //second parameter is top to down
                              ),
                            ],
                            color: Color.fromRGBO(152, 137, 164, 1),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 20,
                        top: 5,
                        child: Container(
                          height: 49.39,
                          width: 49.39,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(
                                    152, 137, 164, 1), //color of shadow
                                spreadRadius: 2, //spread radius
                                blurRadius: 4, // blur radius
                                offset:
                                    Offset(0, 0), // changes position of shadow
                                //first paramerter of offset is left-right
                                //second parameter is top to down
                              ),
                            ],
                            color: Color.fromRGBO(152, 137, 164, 1),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      const userDetailsWidget()
                    ],
                  ),
                ),
              ],
            ),
            // ListTile(
            //   horizontalTitleGap: 10.0,
            //   contentPadding:
            //       const EdgeInsets.symmetric(horizontal: 38, vertical: 5.0),
            //   leading: Image.asset(
            //     "assets/home.png",
            //   ),
            //   title: Text(
            //     "Home",
            //     style: TextStyle(
            //         fontSize: 15,
            //         fontWeight: FontWeight.w500,
            //         color: textColor),
            //   ),
            //   onTap: () {
            //     Get.toNamed(Routes.customBottomNavBar);
            //   },
            // ),
            buildOptionsTile(context, 'assets/switch_to_vendor.svg',
                "Switch to Vendor", Routes.customBottomNavBar),
            buildOptionsTile(context, 'assets/update_profile.svg',
                "Update Profile", Routes.updateProfileScreen),
            buildOptionsTile(context, 'assets/my_article.svg', "My Articles",
                Routes.myArticlesScreen),
            buildOptionsTile(context, 'assets/subscription.svg',
                "Subscriptions", Routes.subscriptionScreen),
            buildOptionsTile(
                context, 'assets/sign_out.svg', "Sign Out", Routes.loginScreen),
            buildOptionsTile(context, 'assets/delete_account.svg',
                "Delete Account", Routes.signUpScreen),
          ],
        ),
      ),
    );
  }

  ListTile buildOptionsTile(BuildContext context, String assetPath,
      String titleText, String routeName) {
    return ListTile(
      horizontalTitleGap: 10.0,
      contentPadding: const EdgeInsets.symmetric(horizontal: 38, vertical: 5.0),
      leading: SvgPicture.asset(
        assetPath,
      ),
      title: Text(
        titleText,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w500, color: textColor),
      ),
      onTap: () {
        Get.toNamed(routeName);
        // Navigator.pushNamed(context, '/$routeName');
      },
    );
  }
}

class userDetailsWidget extends StatelessWidget {
  const userDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      contentPadding: EdgeInsets.only(top: 52, left: 19.0),
      horizontalTitleGap: 15.0,
      minLeadingWidth: 54.0,
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/summayya.png'),
      ),
      title: Text(
        "Summayya",
        style: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1),
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        "Neutral",
        style: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class drawerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 314;
    final double _yScaling = size.height / 156;
    path.lineTo(-6 * _xScaling, -1 * _yScaling);
    path.cubicTo(
      -6 * _xScaling,
      -1 * _yScaling,
      328 * _xScaling,
      -1 * _yScaling,
      328 * _xScaling,
      -1 * _yScaling,
    );
    path.cubicTo(
      328 * _xScaling,
      -1 * _yScaling,
      328 * _xScaling,
      92.8928 * _yScaling,
      328 * _xScaling,
      92.8928 * _yScaling,
    );
    path.cubicTo(
      328 * _xScaling,
      106.951 * _yScaling,
      318.238 * _xScaling,
      119.123 * _yScaling,
      304.516 * _xScaling,
      122.177 * _yScaling,
    );
    path.cubicTo(
      304.516 * _xScaling,
      122.177 * _yScaling,
      179.252 * _xScaling,
      150.049 * _yScaling,
      179.252 * _xScaling,
      150.049 * _yScaling,
    );
    path.cubicTo(
      164.605 * _xScaling,
      153.308 * _yScaling,
      149.413 * _xScaling,
      153.229 * _yScaling,
      134.801 * _xScaling,
      149.818 * _yScaling,
    );
    path.cubicTo(
      134.801 * _xScaling,
      149.818 * _yScaling,
      17.1805 * _xScaling,
      122.362 * _yScaling,
      17.1805 * _xScaling,
      122.362 * _yScaling,
    );
    path.cubicTo(
      3.6041 * _xScaling,
      119.193 * _yScaling,
      -6 * _xScaling,
      107.089 * _yScaling,
      -6 * _xScaling,
      93.1476 * _yScaling,
    );
    path.cubicTo(
      -6 * _xScaling,
      93.1476 * _yScaling,
      -6 * _xScaling,
      -1 * _yScaling,
      -6 * _xScaling,
      -1 * _yScaling,
    );
    path.cubicTo(
      -6 * _xScaling,
      -1 * _yScaling,
      -6 * _xScaling,
      -1 * _yScaling,
      -6 * _xScaling,
      -1 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
