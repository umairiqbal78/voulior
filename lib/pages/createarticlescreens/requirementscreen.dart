import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vouloir/config/bottom_nav_bar.dart';
import 'package:vouloir/config/drawer.dart';
import 'package:vouloir/config/textstyle.dart';
import 'package:vouloir/pages/createarticlescreens/specifics.dart';

import '../../Routes/app_pages.dart';
import '../../config/app_bar.dart';
import '../../config/color_pallete.dart';

class CreateArticleRequirement extends StatefulWidget {
  const CreateArticleRequirement({Key? key}) : super(key: key);

  @override
  State<CreateArticleRequirement> createState() =>
      _CreateArticleRequirementState();
}

class _CreateArticleRequirementState extends State<CreateArticleRequirement> {
  String? _chosenValue;
  int _counter = 0;
  bool _value = false;

  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _descriptionTextController =
      TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        extendBody: true,
        key: scaffoldKey,
        drawerScrimColor: Colors.transparent,
        drawer: const DrawerWidget(),
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        appBar: appBarBuiltMethod(),
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
                    child: Column(
                      children: [
                        Row(children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 34.0, top: 32, bottom: 0.0),
                              //Requirements
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    height: 4.0,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6.25),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/Vector.png",
                                          height: 10.0,
                                          width: 10.0,
                                          color: primaryColor,
                                        ),
                                        const SizedBox(
                                          width: 4.25,
                                          height: 4.25,
                                        ),
                                        Text(
                                          "Requirements",
                                          style: ralewayStyle(
                                            14,
                                            FontWeight.w500,
                                            primaryColor,
                                          ),
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
                              padding: const EdgeInsets.only(
                                  right: 34.0, top: 32, bottom: 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: textColor.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    height: 4.0,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6.25),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/Vector.png",
                                          height: 10,
                                          width: 10,
                                          color: textColor.withOpacity(0.5),
                                        ),
                                        const SizedBox(
                                          width: 4.25,
                                          height: 4.25,
                                        ),
                                        Text(
                                          "Specifics",
                                          style: ralewayStyle(
                                            14,
                                            FontWeight.w500,
                                            primaryColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ]),

                        //Title
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18, 32, 18, 2),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                  text: "Title",
                                  style: ralewayStyle(
                                    14,
                                    FontWeight.w900,
                                    primaryColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " * ",
                                      style: ralewayStyle(
                                        14,
                                        FontWeight.normal,
                                        primaryColor,
                                      ),
                                    ),
                                    TextSpan(
                                        text: " (80 character limit): ",
                                        style: ralewayStyle(
                                          14,
                                          FontWeight.w500,
                                          textColor,
                                        ))
                                  ]),
                            ),
                          ),
                        ),
                        //TextField
                        buildTitleTextField(),

                        //Description
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18, 10, 18, 2),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                  text: "Description",
                                  style: ralewayStyle(
                                    14,
                                    FontWeight.w900,
                                    textColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " * ",
                                      style: ralewayStyle(
                                        14,
                                        FontWeight.normal,
                                        Colors.red,
                                      ),
                                    ),
                                    TextSpan(
                                        text: " (240 character limit): ",
                                        style: ralewayStyle(
                                          10,
                                          FontWeight.w500,
                                          textColor,
                                        ))
                                  ]),
                            ),
                          ),
                        ),
                        //TextField
                        buildDescriptionTextField(),
                        //Quantity    Quantity Unit
                        Row(children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(18, 08, 18, 2),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text.rich(
                                      TextSpan(
                                          text: "Quantity",
                                          style: ralewayStyle(
                                            14,
                                            FontWeight.w600,
                                            textColor,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: " * ",
                                              style: ralewayStyle(
                                                14,
                                                FontWeight.w500,
                                                Colors.red,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                                buildQuantityCounterButton()
                              ],
                            ),
                          ),
                          //Quantity Unit
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 08, 18, 2),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text.rich(
                                      TextSpan(
                                          text: "Quantity Unit",
                                          style: ralewayStyle(
                                            14,
                                            FontWeight.w600,
                                            textColor,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: " * ",
                                              style: ralewayStyle(
                                                14,
                                                FontWeight.normal,
                                                Colors.red,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                                //Dropdown
                                buildQuantityDropDown()
                              ],
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),
                ),

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
                              style: ralewayStyle(
                                16,
                                FontWeight.w900,
                                textColor,
                              ),
                            ),

                            //toggle button
                            Switch.adaptive(
                                value: _value,
                                thumbColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.white),
                                activeColor:
                                    const Color.fromRGBO(42, 237, 10, 0.72),
                                onChanged: (value) {
                                  setState(() {
                                    _value = value;
                                  });
                                })
                          ],
                        ),
                      ),
                    )),

                //NEXT
                NextButton(formKey: _formKey, value: _value)
              ],
            ),
          ),
        ),
        // bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 1),
      ),
    );
  }

  AppBar appBarBuiltMethod() {
    return AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8.0, 0.0, 8.0),
          child: GestureDetector(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
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
                Icons.person,
                color: secColor,
                size: 18,
              ),
            ),
          ),
        ),
        title: Text(
          "Create Article",
          style: ralewayStyle(16.0, FontWeight.w600, textColor),
        ));
  }

  Padding buildQuantityDropDown() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 6.25, left: 10.0, right: 20.0, bottom: 31),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
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
              style: ralewayStyle(
                12,
                FontWeight.w500,
                Colors.white,
              ),
              items: <String>[
                'Kilo',
                'Hectare',
                'Kilogram',
                'Litre',
                'micro',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11.0),
                    child: Text(
                      value,
                      style: ralewayStyle(
                        14,
                        FontWeight.w500,
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
    );
  }

  Padding buildQuantityCounterButton() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 6.25, bottom: 31, left: 17.0, right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // minus button
          GestureDetector(
            onTap: () => setState(() {
              if (_counter > 0) {
                _counter = _counter - 1;
              }
            }),
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Container(
                alignment: Alignment.center,
                height: 22,
                width: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor,
                ),
                child: const FaIcon(
                  FontAwesomeIcons.minus,
                  color: Colors.white,
                  size: 10,
                ),
              ),
            ),
          ),

          // counter view
          Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0)),
                child: Text(
                  _counter.toString(),
                  style: ralewayStyle(
                    14,
                    FontWeight.w600,
                    textColor,
                  ),
                )),
          ),
          //add button
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: GestureDetector(
              onTap: () => setState(() {
                if (_counter >= 0) {
                  _counter = _counter + 1;
                }
              }),
              child: Container(
                alignment: Alignment.center,
                height: 22,
                width: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor,
                ),
                child: const FaIcon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                  size: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildDescriptionTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 04, 18, 12),
      child: Container(
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0)),
        child: TextFormField(
          controller: _descriptionTextController,
          style: ralewayStyle(
            12,
            FontWeight.w400,
            textColor,
          ),
          textInputAction: TextInputAction.done,
          minLines: 5,
          maxLines: 5,
          inputFormatters: [
            LengthLimitingTextInputFormatter(240),
          ],
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: 'Enter Description here..',
            hintStyle: ralewayStyle(
              14,
              FontWeight.w500,
              secColor,
            ),
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
    );
  }

  buildTitleTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 04, 18, 12),
      child: Container(
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0)),
        child: TextFormField(
          textInputAction: TextInputAction.done,
          controller: _titleTextController,
          minLines: 3,
          maxLines: 3,
          inputFormatters: [
            LengthLimitingTextInputFormatter(80),
          ],
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: 'Enter Title here..',
            hintStyle: ralewayStyle(
              14,
              FontWeight.w500,
              secColor,
            ),
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
              return 'Please enter title';
            }
            return null;
          },
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required bool value,
  })  : _formKey = formKey,
        _value = value,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final bool _value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 120),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(78),
            color: primaryColor,
          ),
          height: 48,
          width: 241,
          child: ElevatedButton(
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                // Get.toNamed(Routes.createArticleSpecifics,
                //     arguments: {"value": _value});
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateArticleSpecifics(
                              value: _value,
                            )));
                // } else {
                //   print('Error');
                // }
              },
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                shadowColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48.0),
                ),
              ),
              child: Text(
                "Next",
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
