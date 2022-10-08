import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vouloir/config/app_bar.dart';
import 'package:vouloir/config/button.dart';
import 'package:vouloir/pages/home/widgets/filter_bottom_sheet.dart';
import 'package:vouloir/pages/updateprofile/verificationImagesBottomSheet.dart';

import '../../config/color_pallete.dart';
import '../../config/drawer.dart';
import '../../config/textstyle.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _picker = ImagePicker();
  File? profilePic;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      key: scaffoldKey,
      drawerScrimColor: Colors.transparent,
      drawer: const DrawerWidget(),
      appBar: appBarwithLeading(context, "Update Profile"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 17),
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              //Field Containers.

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 21,
                    ),
                    child: Container(
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
                            const SizedBox(height: 60.0),
                            //Expected Delivery
                            Text.rich(
                              TextSpan(
                                  text: "Name",
                                  style: ralewayStyle(
                                      14, FontWeight.w600, textColor),
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
                                  text: "Location",
                                  style: ralewayStyle(
                                      14, FontWeight.w600, textColor),
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
                              height: 24,
                            ),
                            Text.rich(
                              TextSpan(
                                  text: "About",
                                  style: ralewayStyle(
                                      14, FontWeight.w600, textColor),
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
                                style: ralewayStyle(
                                    14, FontWeight.w400, textColor),
                                textInputAction: TextInputAction.done,
                                minLines: 5,
                                maxLines: 5,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(240),
                                ],
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                keyboardType: TextInputType.multiline,
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter description';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: CustomButtonWidget(
                        title: "Verify your profile",
                        onPressed: () {
                          bottomSheet(context);
                        }),
                  )
                ],
              ),
              CircleAvatar(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    // Container(
                    //   height: 90,
                    //           width: 90,
                    //   decoration:BoxDecoration(image: DecorationImage(image: profilePic != null ? FileImage(
                    //           profilePic!,

                    //         )
                    //       : AssetImage(,
                    //          )))),
                    // ClipOval(
                    //   child: profilePic != null
                    //       ? Image.file(
                    //           profilePic!,
                    //           fit: BoxFit.fill,
                    //           height: 90,
                    //           width: 90,
                    //         )
                    //       : Image.asset('assets/update_profile.png',
                    //           fit: BoxFit.fill),
                    // ),
                    profilePic != null
                        ? Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: FileImage(profilePic!),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        : Container(
                            height: 90,
                            width: 90,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/update_profile.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                    GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(23),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12))),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.photo,
                                              color: secColor,
                                              size: 22,
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                final XFile? pickedProfilePic =
                                                    await _picker.pickImage(
                                                        source: ImageSource
                                                            .gallery);
                                                if (pickedProfilePic != null) {
                                                  profilePic = File(
                                                      pickedProfilePic.path);
                                                  BotToast.showText(
                                                    text: "Image uploaded",
                                                    contentColor: primaryColor,
                                                    textStyle: ralewayStyle(
                                                        14,
                                                        FontWeight.w500,
                                                        Colors.white),
                                                  );
                                                  setState(() {
                                                    Navigator.pop(context);
                                                  });
                                                } else {
                                                  BotToast.showText(
                                                    text:
                                                        "Image uploading Failed",
                                                    contentColor: primaryColor,
                                                    textStyle: ralewayStyle(
                                                        14,
                                                        FontWeight.w500,
                                                        Colors.white),
                                                  );
                                                  Navigator.pop(context);
                                                }
                                              },
                                              child: Text(
                                                "Gallery",
                                                style: ralewayStyle(18,
                                                    FontWeight.w600, textColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.camera_alt_rounded,
                                              color: secColor,
                                              size: 22,
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                final XFile? pickedProfilePic =
                                                    await _picker.pickImage(
                                                        source:
                                                            ImageSource.camera,
                                                        preferredCameraDevice:
                                                            CameraDevice.front);
                                                if (pickedProfilePic != null) {
                                                  profilePic = File(
                                                      pickedProfilePic.path);
                                                  BotToast.showText(
                                                    text: "Image uploaded",
                                                    contentColor: primaryColor,
                                                    textStyle: ralewayStyle(
                                                        14,
                                                        FontWeight.w500,
                                                        Colors.white),
                                                  );
                                                  setState(() {
                                                    Navigator.pop(context);
                                                  });
                                                } else {
                                                  BotToast.showText(
                                                    text:
                                                        "Image uploading Failed",
                                                    contentColor: primaryColor,
                                                    textStyle: ralewayStyle(
                                                        14,
                                                        FontWeight.w500,
                                                        Colors.white),
                                                  );
                                                  Navigator.pop(context);
                                                }
                                              },
                                              child: Text(
                                                "Camera",
                                                style: ralewayStyle(18,
                                                    FontWeight.w600, textColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                );
                              });
                        },
                        child: Image.asset("assets/edit_profile.png"))
                  ],
                ),
                backgroundColor: Colors.transparent,
                radius: 50,
              )
            ],
          ),
        ),
      ),
    );
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
        "Update Profile",
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 08.0, 12.0, 6.0),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Save",
                  style: ralewayStyle(14, FontWeight.w500, secColor),
                )))
      ],
    );
  }

  bottomSheet(BuildContext context) {
    showModalBottomSheet(
      constraints: BoxConstraints.tight(Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * .90)),
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(23),
        ),
      ),
      context: context,

      // ignore: prefer_const_literals_to_create_immutables
      builder: (context) => const VerifyBottomSheet(),
    );
  }
}
