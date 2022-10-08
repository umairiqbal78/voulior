import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vouloir/Routes/app_pages.dart';
import 'package:vouloir/config/app_bar.dart';
import 'package:vouloir/config/button.dart';
import 'package:vouloir/config/textstyle.dart';

import '../../../config/color_pallete.dart';

class PostPropScreen extends StatefulWidget {
  const PostPropScreen({Key? key}) : super(key: key);

  @override
  State<PostPropScreen> createState() => _PostPropScreenState();
}

class _PostPropScreenState extends State<PostPropScreen> {
  bool giveAway = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF5F5F5),
      appBar: appBarwithLeading(context, "Post Prop"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: secColor.withOpacity(0.1)),
                          color: cardColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(7.0)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Description
                            Text.rich(
                              TextSpan(
                                  text: "Description",
                                  style: ralewayStyle(
                                      16, FontWeight.w600, textColor),
                                  children: [
                                    const TextSpan(
                                      text: " * ",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 14),
                                    ),
                                    TextSpan(
                                      text: " (240 character limit): ",
                                      style: ralewayStyle(
                                          10, FontWeight.w400, textColor),
                                    )
                                  ]),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            //TextField
                            buildDescriptionTextField(),
                          ]),
                    ),
                    // Second Container
                    //
                    //
                    const SizedBox(
                      height: 14,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: secColor.withOpacity(0.1)),
                          color: cardColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(7.0)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Expected Delivery
                            Text.rich(
                              TextSpan(
                                  text: "Expected Delivery",
                                  style: ralewayStyle(
                                      16, FontWeight.w600, textColor),
                                  children: const [
                                    TextSpan(
                                      text: " * ",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 14),
                                    ),
                                  ]),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            //TextField
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: primaryColor.withOpacity(0.05),
                                      spreadRadius: 3,
                                      blurRadius: 8,
                                      offset: const Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                  border: Border.all(
                                      color: secColor.withOpacity(0.1)),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: '',
                                  hintStyle: ralewayStyle(
                                      14, FontWeight.w500, secColor),
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //Amount
                            Text.rich(
                              TextSpan(
                                  text: "Amount",
                                  style: ralewayStyle(
                                      16, FontWeight.w600, textColor),
                                  children: const [
                                    TextSpan(
                                      text: " * ",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 14),
                                    ),
                                  ]),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            //TextField
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: primaryColor.withOpacity(0.05),
                                      spreadRadius: 3,
                                      blurRadius: 8,
                                      offset: const Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                  border: Border.all(
                                      color: secColor.withOpacity(0.1)),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: '',
                                  hintStyle: ralewayStyle(
                                      14, FontWeight.w500, secColor),
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                      )),
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 14,
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.fromLTRB(16, 11, 12, 10.5),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.05),
                              spreadRadius: 3,
                              blurRadius: 8,
                              offset: const Offset(
                                  0, 4), // changes position of shadow
                            ),
                          ],
                          border: Border.all(color: secColor.withOpacity(0.1)),
                          color: cardColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                                text: "Note:",
                                style: ralewayStyle(
                                    14, FontWeight.w600, primaryColor),
                                children: [
                                  TextSpan(
                                    text:
                                        " 1 prop will be dedcuted in case of amount and 0 in giveaway.    ",
                                    style: ralewayStyle(
                                        12, FontWeight.w600, primaryColor),
                                  ),
                                  TextSpan(
                                      text: " 4 props available",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 12,
                                        color: textColor,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Raleway",
                                      )),
                                ]),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Paid/Giveaway",
                                style: ralewayStyle(
                                    16, FontWeight.w600, textColor),
                              ),
                              const SizedBox(
                                width: 15.93,
                              ),
                              Switch.adaptive(
                                  activeColor:
                                      const Color.fromRGBO(42, 237, 10, 0.72),
                                  thumbColor: MaterialStateProperty.resolveWith(
                                      (states) => Colors.white),
                                  inactiveTrackColor: textColor,
                                  inactiveThumbColor: Colors.white,
                                  value: giveAway,
                                  onChanged: (value) {
                                    setState(() {
                                      giveAway = value;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                  ],
                ),
              ),
            ),
            Container(
                height: 92,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22)),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(top: 21.0, bottom: 20),
                  child: CustomButtonWidget(
                      title: giveAway ? "Giveaway" : "Send it for 1 prop",
                      onPressed: () {
                        Get.toNamed(Routes.customBottomNavBar);
                      }),
                )),
          ],
        ),
      ),
    );
  }

  Container buildDescriptionTextField() {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.05),
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
          border: Border.all(color: secColor.withOpacity(0.1)),
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8.0)),
      child: TextFormField(
        style: ralewayStyle(14, FontWeight.w400, textColor),
        textInputAction: TextInputAction.done,
        minLines: 5,
        maxLines: 5,
        inputFormatters: [
          LengthLimitingTextInputFormatter(240),
        ],
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: '',
          hintStyle: ralewayStyle(14, FontWeight.w500, secColor),
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.transparent,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.transparent,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.transparent,
              )),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter description';
          }
          return null;
        },
      ),
    );
  }
}
