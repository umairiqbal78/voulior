import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vouloir/config/app_bar.dart';
import 'package:vouloir/config/button.dart';
import 'package:vouloir/config/color_pallete.dart';
import 'package:vouloir/config/textstyle.dart';
import 'package:vouloir/pages/auth/curves_clipper.dart';

import '../../Routes/app_pages.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                padding: EdgeInsets.only(top: height * 0.110),
                child: SingleChildScrollView(
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
                        height: height * 0.12,
                      ),
                      Text(
                        "Login",
                        style: ralewayStyle(30, FontWeight.w500, Colors.white),
                      ),
                      SizedBox(
                        height: height * 0.16,
                      ),
                      // SvgPicture.asset(
                      //   'assets/splash.svg',
                      //   height: height * 0.40,
                      //   width: width * 0.90,
                      // ),
                      // SizedBox(
                      //   height: height * 0.05,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 29.0),
                      //   child: Text(
                      //     "Lorem ipsum dolor sit amet. Aut dolore velit qui rerum voluptas et rerum cupiditate non amet galisum. ",
                      //     style: ralewayStyle(14, FontWeight.w500, textColor),
                      //     textAlign: TextAlign.center,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: height * 0.04,
                      // ),
                      // CustomButtonWidget(title: "Login", onPressed: () {}),
                      SizedBox(height: height * 0.03),
                      GestureDetector(
                        onTap: () {
                          Get.offAllNamed(Routes.customBottomNavBar);
                        },
                        child: Center(
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
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
                              child: Row(
                                children: [
                                  Image.asset('assets/google.png'),
                                  Expanded(
                                    child: Text(
                                      "Continue with Google",
                                      style: ralewayStyle(
                                        14,
                                        FontWeight.w500,
                                        primaryColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Center(
                        child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
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
                            child: Row(
                              children: [
                                // const Icon(Icons.facebook_rounded,
                                //     color: Color.fromRGBO(66, 103, 178, 1)),
                                SvgPicture.asset(
                                  'assets/facebook.svg',
                                  height: 24,
                                  width: 24,
                                ),
                                Expanded(
                                  child: Text(
                                    "Continue with Facebook",
                                    style: ralewayStyle(
                                      14,
                                      FontWeight.w500,
                                      primaryColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(height: height * 0.03),
                      Center(
                        child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
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
                            child: Row(
                              children: [
                                // const Icon(
                                //   Icons.apple,
                                //   color: Colors.black,
                                // ),
                                SvgPicture.asset(
                                  'assets/apple.svg',
                                  height: 30,
                                  width: 30,
                                ),
                                Expanded(
                                  child: Text(
                                    "Continue with Apple Id",
                                    style: ralewayStyle(
                                      14,
                                      FontWeight.w500,
                                      primaryColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(height: height * 0.07),
                      Text.rich(TextSpan(
                          text: "Don’t have an account yet? ",
                          style:
                              ralewayStyle(14, FontWeight.w500, Colors.black),
                          children: <InlineSpan>[
                            const TextSpan(text: " "),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(Routes.signUpScreen);
                                },
                              text: "Signup",
                              style: ralewayStyle(
                                  14, FontWeight.w500, const Color(0xff0057FF)),
                            )
                          ])),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
