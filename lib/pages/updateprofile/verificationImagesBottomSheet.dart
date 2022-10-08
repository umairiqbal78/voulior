import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vouloir/config/button.dart';
import 'package:vouloir/config/color_pallete.dart';
import 'package:vouloir/config/textstyle.dart';
import 'package:path/path.dart';

class VerifyBottomSheet extends StatefulWidget {
  const VerifyBottomSheet({Key? key}) : super(key: key);

  @override
  State<VerifyBottomSheet> createState() => _VerifyBottomSheetState();
}

class _VerifyBottomSheetState extends State<VerifyBottomSheet> {
  final _picker = ImagePicker();
  File? backSideImage;
  File? frontSideImage;
  String? frontImageName;
  String? backImageName;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: 700,
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.fromLTRB(37, 28, 17, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Account verification",
            style: ralewayStyle(16.0, FontWeight.w600, textColor),
          ),
          const SizedBox(
            height: 30,
          ),
          Text.rich(
            TextSpan(
                text: "ID Card Front",
                style: ralewayStyle(16, FontWeight.w500, textColor),
                children: const [
                  TextSpan(
                    text: " * ",
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ]),
          ),
          const SizedBox(
            height: 10.0,
          ),
          GestureDetector(
              onTap: () async {
                final XFile? pickedImageFront =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (pickedImageFront != null) {
                  setState(() {
                    frontSideImage = File(pickedImageFront.path);

                    frontImageName =
                        "Front Side." + pickedImageFront.path.split(".").last;
                  });

                  BotToast.showText(
                      text: "Image uploaded",
                      textStyle:
                          ralewayStyle(14, FontWeight.w500, Colors.white),
                      contentColor: primaryColor);
                } else {
                  BotToast.showText(
                      duration: const Duration(seconds: 1),
                      text: "Image uploading failed",
                      textStyle:
                          ralewayStyle(14, FontWeight.w500, Colors.white),
                      contentColor: primaryColor);
                }
              },
              child: frontImageName == null
                  ? Row(
                      children: [SvgPicture.asset('assets/upload_pic.svg')],
                    )
                  : Row(
                      children: [
                        SvgPicture.asset('assets/image_upload_disable.svg'),
                        const SizedBox(
                          width: 20.9,
                        ),
                        Text(
                          frontImageName.toString(),
                          style: ralewayStyle(14, FontWeight.w500, secColor),
                        ),
                        const SizedBox(
                          width: 18.0,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                frontSideImage!.deleteSync(recursive: true);
                                frontImageName = null;
                              });
                            },
                            child: SvgPicture.asset('assets/cancel_image.svg'))
                      ],
                    )),
          const SizedBox(
            height: 30,
          ),
          Text.rich(
            TextSpan(
                text: "ID Card Back",
                style: ralewayStyle(16, FontWeight.w500, textColor),
                children: const [
                  TextSpan(
                    text: " * ",
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ]),
          ),
          const SizedBox(
            height: 10.0,
          ),
          GestureDetector(
              onTap: () async {
                final XFile? pickedImagaBack = await _picker.pickImage(
                  source: ImageSource.gallery,
                  imageQuality: 100,
                  preferredCameraDevice: CameraDevice.rear,
                );
                if (pickedImagaBack != null) {
                  setState(() {
                    backSideImage = File(pickedImagaBack.path);

                    backImageName =
                        "Image Back." + pickedImagaBack.path.split(".").last;
                  });

                  BotToast.showText(
                      duration: const Duration(milliseconds: 500),
                      text: "Image uploaded",
                      textStyle:
                          ralewayStyle(14, FontWeight.w500, Colors.white),
                      contentColor: primaryColor);
                } else {
                  BotToast.showText(
                      text: "Image uploading failed",
                      textStyle:
                          ralewayStyle(14, FontWeight.w500, Colors.white),
                      contentColor: primaryColor);
                }
              },
              child: backImageName == null
                  ? Row(
                      children: [SvgPicture.asset('assets/upload_pic.svg')],
                    )
                  : Row(
                      children: [
                        SvgPicture.asset('assets/image_upload_disable.svg'),
                        const SizedBox(
                          width: 20.9,
                        ),
                        Text(
                          backImageName.toString(),
                          style: ralewayStyle(14, FontWeight.w500, secColor),
                        ),
                        const SizedBox(
                          width: 18.0,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                backSideImage!.deleteSync(recursive: true);
                                backImageName = null;
                              });
                            },
                            child: SvgPicture.asset('assets/cancel_image.svg'))
                      ],
                    )),
          const Spacer(),
          Center(
            child: CustomButton(
                title: "Apply for verification",
                onPressed: () {
                  if (frontSideImage != null && backSideImage != null) {
                    BotToast.showText(
                        duration: const Duration(milliseconds: 500),
                        text: "Verified",
                        textStyle:
                            ralewayStyle(14, FontWeight.w500, Colors.white),
                        contentColor: primaryColor);
                    Navigator.pop(context);
                  } else {
                    BotToast.showText(
                      text: "Add both side pictures",
                      contentColor: primaryColor,
                      textStyle:
                          ralewayStyle(14, FontWeight.w500, Colors.white),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
