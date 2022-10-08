import 'package:flutter/material.dart';
import 'package:vouloir/config/textstyle.dart';

import '../../../../config/color_pallete.dart';

class NeutralSubscription extends StatelessWidget {
  const NeutralSubscription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.63,
          decoration: BoxDecoration(
              border: Border.all(color: secColor.withOpacity(0.1)),
              color: cardColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(7.0)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 20.0),
            child: Container(
              alignment: Alignment.topCenter,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 0.0,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromRGBO(130, 115, 151, 0.94),
                                Color.fromRGBO(130, 115, 151, 0.89),
                              ])),
                      padding: const EdgeInsets.only(top: 39, left: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.12),
                            child: Text(
                              "Neutral (Free)",
                              style: ralewayStyle(
                                  24, FontWeight.w600, Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                "30 props per month",
                                style: ralewayStyle(
                                    16, FontWeight.w500, Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                "Lorem Ipsum",
                                style: ralewayStyle(
                                    16, FontWeight.w500, Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                "Lorem ipsum",
                                style: ralewayStyle(
                                    16, FontWeight.w500, Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    child: Container(
                      alignment: Alignment.center,
                      height: 48.0,
                      width: MediaQuery.of(context).size.width * 0.60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48.0),
                        color: primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color:
                                primaryColor.withOpacity(0.5), //color of shadow
                            spreadRadius: 5, //spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Text(
                        "Select this plan",
                        style: ralewayStyle(16, FontWeight.w600, Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
