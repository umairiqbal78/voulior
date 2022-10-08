import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vouloir/config/bottom_nav_bar.dart';
import 'package:vouloir/config/textstyle.dart';
import '../../config/app_bar.dart';
import '../../config/color_pallete.dart';

class CreateArticleSpecifics extends StatefulWidget {
  CreateArticleSpecifics({
    Key? key,
    required this.value,
  }) : super(key: key);
  bool value;
  // bool value = Get.arguments["value"];

  @override
  State<CreateArticleSpecifics> createState() => _CreateArticleSpecificsState();
}

class _CreateArticleSpecificsState extends State<CreateArticleSpecifics> {
  String? _chosenValue;
  String? _chosenValueSubCategory;

  String? _newfilePath;
  String? _newfile2Path;

  String? _newfile3Path;

  final TextEditingController _tagTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        appBar: appBarBuiltMethod(context),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(22, 20, 21, 0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: secColor.withOpacity(0.1)),
                          color: cardColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(7.0)),
                      child: Column(children: [
                        // top divider
                        DividerRequirementAndSpecificMethod(),

                        //Select Category
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18, 32, 18, 2),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                  text: "Select Category",
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900),
                                  children: const [
                                    TextSpan(
                                      text: " * ",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 14),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                        //DropDown
                        buildSelectCatagoryDropDown(),
                        //Select Sub Category

                        Padding(
                          padding: const EdgeInsets.fromLTRB(18, 22, 18, 2),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                  text: "Select Sub Category",
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900),
                                  children: [
                                    TextSpan(
                                      text: "   (Optional)",
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                        //DropDown
                        buildSubCatagoryDropdown(),
                        //Tags
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18, 22, 18, 2),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                  text: "Tags",
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900),
                                  children: const [
                                    TextSpan(
                                      text: " * ",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                        // Add tag Formfield
                        buildTagsFormField(),
                      ]),
                    )), //Attachements

                Padding(
                    padding: const EdgeInsets.fromLTRB(22, 20, 21, 0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: secColor.withOpacity(0.1)),
                          color: cardColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(7.0)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 13, 17, 15.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text.rich(
                                TextSpan(
                                    text: "Attachments",
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900),
                                    children: [
                                      TextSpan(
                                        text: "   (upto 3)",
                                        style: TextStyle(
                                            color: textColor,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ]),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DottedBorder(
                                    color: const Color(0xffB0B8BF),
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(17),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(17)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(78),
                                          color: const Color.fromRGBO(
                                            233,
                                            213,
                                            202,
                                            1,
                                          ),
                                        ),
                                        height: 48,
                                        width: 299,
                                        child: ElevatedButton(
                                            onPressed: () async {
                                              final result = await FilePicker
                                                  .platform
                                                  .pickFiles(
                                                allowMultiple: true,
                                              );
                                              if (result == null) return;

                                              openFiles(result.files);

                                              setState(() {
                                                _newfilePath =
                                                    result.files.first.name;
                                                _newfile2Path = result.files
                                                    .elementAt(1)
                                                    .name;
                                                _newfile3Path = result.files
                                                    .elementAt(2)
                                                    .name;
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: const Color.fromRGBO(
                                                233,
                                                213,
                                                202,
                                                1,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(17.0),
                                              ),
                                            ),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons.paperclip,
                                                    color: textColor,
                                                    size: 16,
                                                  ),
                                                  const SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Text(
                                                    "Attach files",
                                                    style: TextStyle(
                                                        color: textColor,
                                                        fontSize: 16),
                                                  ),
                                                ])),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  if (_newfilePath == null)
                                    const Text("")
                                  else
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            " * ${_newfilePath.toString()}")),
                                  if (_newfile2Path == null)
                                    const Text("")
                                  else
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            " * ${_newfile2Path.toString()}")),
                                  if (_newfile3Path == null)
                                    const Text("")
                                  else
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            " * ${_newfile3Path.toString()}")),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )),

                //Notify Vendors
                Padding(
                    padding: const EdgeInsets.fromLTRB(22, 20, 21, 0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: secColor.withOpacity(0.1)),
                          color: cardColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(7.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, top: 13, bottom: 15.0),
                        child: Row(
                          children: [
                            //Notify Vendor
                            Text(
                              "Notify Vendors",
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900),
                            ),

                            //toggle button
                            Switch.adaptive(
                                value: widget.value,
                                thumbColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.white),
                                activeColor:
                                    const Color.fromRGBO(42, 237, 10, 0.72),
                                onChanged: (value) {
                                  setState(() {
                                    widget.value = value;
                                  });
                                })
                          ],
                        ),
                      ),
                    )),

                //Create Article Button
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 41),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(78),
                          color: primaryColor,
                        ),
                        height: 48,
                        width: 241,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print("Process Data");
                                Navigator.pushNamed(
                                    context, "/ArticleDetailViewScreen");
                              } else {
                                print('Error');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shadowColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(48.0),
                              ),
                            ),
                            child: const Text(
                              "Create Article",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 1),
      ),
    );
  }

  Row DividerRequirementAndSpecificMethod() {
    return Row(children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 28.0, top: 32, bottom: 0.0),
          //Requirements
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(100)),
                height: 4.0,
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.25, bottom: 2.75),
                child: Row(
                  children: [
                    Container(
                      height: 20.5,
                      width: 20.5,
                      child: Icon(
                        Icons.check_circle,
                        color: primaryColor,
                        size: 18.5,
                      ),
                    ),
                    const SizedBox(
                      width: 4.25,
                      height: 4.25,
                    ),
                    Text(
                      "Requirements",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      const SizedBox(width: 8.0, height: 4.0),
      //Specifics
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right: 34.0, top: 32, bottom: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(100)),
                height: 4.0,
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.25),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/Vector.png",
                      color: primaryColor,
                    ),
                    const SizedBox(
                      width: 4.25,
                      height: 4.25,
                    ),
                    Text(
                      "Specifics",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }

  AppBar appBarBuiltMethod(BuildContext context) {
    return AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8.0, 0.0, 8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
                Icons.arrow_back,
                color: secColor,
                size: 18,
              ),
            ),
          ),
        ),
        title: const Text(
          'Create Artcle',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ));
  }

  Row buildTagsFormField() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 20.0, right: 20, bottom: 17),
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: TextFormField(
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textInputAction: TextInputAction.done,
                  controller: _tagTextController,
                  minLines: 1,
                  maxLines: 1,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    contentPadding: const EdgeInsets.only(left: 19),
                    hintText: 'Add tags',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: secColor),
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
                      return 'Please enter tag';
                    }
                    return null;
                  },
                ),
              ),
            )),
      ],
    );
  }

  Row buildSubCatagoryDropdown() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child:
                //Dropdown
                Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      hint: Text(
                        "Select Sub Category",
                        style: ralewayStyle(12, FontWeight.w400, secColor),
                      ),
                      iconDisabledColor: primaryColor,
                      iconEnabledColor: primaryColor,
                      isExpanded: true,
                      menuMaxHeight: 160,
                      itemHeight: 50.0,
                      iconSize: 34,
                      dropdownColor: Colors.white,
                      focusColor: Colors.white,
                      value: _chosenValueSubCategory,
                      elevation: 5,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      items: <String>[
                        'MRO & Capex',
                        'Marketing',
                        'General & Admin',
                        'Packaging',
                        'Others',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              value,
                              style: ralewayStyle(
                                10,
                                FontWeight.w600,
                                textColor,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _chosenValueSubCategory = value;
                        });
                      }),
                ),
              ),
            )),
      ],
    );
  }

  Row buildSelectCatagoryDropDown() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child:
                //Dropdown
                Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      hint: Text(
                        "Select Category",
                        style: ralewayStyle(12, FontWeight.w400, secColor),
                      ),
                      iconDisabledColor: primaryColor,
                      iconEnabledColor: primaryColor,
                      isExpanded: true,
                      menuMaxHeight: 160,
                      itemHeight: 50.0,
                      iconSize: 34,
                      dropdownColor: Colors.white,
                      focusColor: Colors.white,
                      value: _chosenValue,
                      elevation: 5,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      items: <String>[
                        'MRO & Capex',
                        'Marketing',
                        'General & Admin',
                        'Packaging',
                        'Others',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 11.0),
                            child: Text(
                              value,
                              style: ralewayStyle(
                                10,
                                FontWeight.w600,
                                textColor,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _chosenValue = value;
                        });
                      }),
                ),
              ),
            )),
      ],
    );
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path.toString());
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');

    return File(file.path!.toString()).copy(newFile.path);
  }

  void openFiles(List<PlatformFile> files) {}
}
