import 'package:flutter/material.dart';
import 'package:vouloir/config/color_pallete.dart';
import 'package:vouloir/config/textstyle.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);
  String title;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 120),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(78),
            color: primaryColor,
            boxShadow: const [
              BoxShadow(
                color: Color(0x9E27448E), //color of shadow
                spreadRadius: 0, //spread radius
                blurRadius: 9, // blur radius
                offset: Offset(0, 4), // changes position of shadow
                //first paramerter of offset is left-right
                //second parameter is top to down
              ),
              //you can set more BoxShadow() here
            ],
          ),
          height: 48,
          width: MediaQuery.of(context).size.width -
              (MediaQuery.of(context).size.width * 0.25),
          child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                shadowColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48.0),
                ),
              ),
              child: Text(
                title,
                style: ralewayStyle(
                  16,
                  FontWeight.w600,
                  Colors.white,
                ),
              )),
        ),
      ),
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget({Key? key, required this.title, required this.onPressed})
      : super(key: key);
  String title;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(78),
          color: primaryColor,
        ),
        height: 48,
        width: MediaQuery.of(context).size.width -
            (MediaQuery.of(context).size.width * 0.25),
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              alignment: Alignment.center,
              shadowColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48.0),
              ),
            ),
            child: Text(
              title,
              style: ralewayStyle(
                16,
                FontWeight.w600,
                Colors.white,
              ),
            )),
      ),
    );
  }
}
