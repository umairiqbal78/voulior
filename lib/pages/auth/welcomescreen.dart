import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vouloir/Routes/app_pages.dart';
import 'package:vouloir/config/app_bar.dart';
import 'package:vouloir/config/button.dart';
import 'package:vouloir/config/color_pallete.dart';
import 'package:vouloir/config/textstyle.dart';
import 'package:vouloir/pages/auth/curves_clipper.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: cardColor,
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipPath(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  color: const Color.fromRGBO(54, 48, 98, 1),
                ),
                clipper: BottomClipper(),
              ),
              ClipPath(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  color: const Color.fromRGBO(130, 115, 151, 1),
                ),
                clipper: UpperClipper(),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.090),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Vouloir",
                      style: TextStyle(
                          fontFamily: "Federo",
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: height * 0.055,
                    ),
                    Text(
                      "Procurement App",
                      style: ralewayStyle(30, FontWeight.w500, Colors.white),
                    ),
                    SizedBox(
                      height: height * 0.045,
                    ),
                    SvgPicture.asset(
                      'assets/splash.svg',
                      height: height * 0.40,
                      width: width * 0.90,
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 29.0),
                      child: Text(
                        "Lorem ipsum dolor sit amet. Aut dolore velit qui rerum voluptas et rerum cupiditate non amet galisum. ",
                        style: ralewayStyle(14, FontWeight.w500, textColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    CustomButtonWidget(
                        title: "Login",
                        onPressed: () {
                          Get.toNamed(Routes.loginScreen);
                        }),
                    SizedBox(height: height * 0.03),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.signUpScreen);
                        },
                        child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(78),
                              border: Border.all(color: secColor, width: 1.0),
                              color: cardColor,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromRGBO(0, 0, 0, 0.62)
                                      .withOpacity(0.2), //color of shadow
                                  spreadRadius: 0, //spread radius
                                  blurRadius: 9, // blur radius
                                  offset: const Offset(
                                      0, 4), // changes position of shadow
                                  //first paramerter of offset is left-right
                                  //second parameter is top to down
                                ),
                                //you can set more BoxShadow() here
                              ],
                            ),
                            height: 48,
                            width: width - (width * 0.25),
                            child: Text(
                              "Create an account",
                              style: ralewayStyle(
                                14,
                                FontWeight.w600,
                                primaryColor,
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
