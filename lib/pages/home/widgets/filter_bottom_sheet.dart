import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multiselect/multiselect.dart';
import 'package:provider/provider.dart';
import 'package:vouloir/config/color_pallete.dart';
import 'package:vouloir/pages/home/model/home_page_model.dart';
import 'package:vouloir/pages/home/widgets/multi_select_dropdown.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  List<String> categorySelected = [];
  List<String> subCategorySelected = [];
  List<String> tags = [];
  List<String> options = [
    'News',
    'Entertainment',
    'Politics',
    'Automotive',
    'Sports',
    'Fashion',
    'Travel',
    'Tech',
    'Science',
  ];

  @override
  Widget build(BuildContext context) {
    final homePageModel = context.watch<HomePageModel>();
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 20.0),
        padding: const EdgeInsets.fromLTRB(37, 28, 17, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 31.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Set Filters',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          homePageModel.clearFilterDefaultColor();
                          setState(() {
                            categorySelected.clear();
                            subCategorySelected.clear();
                            tags.clear();
                          });
                        },
                        child: Text(
                          "Clear Filter",
                          style: TextStyle(
                              color: secColor,
                              fontSize: 14,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 1.0, top: 31),
              child: Text(
                "Category",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Raleway',
                    color: textColor),
              ),
            ),
            //DropDown Category
            dropDownCategoryButton(),
            //Sub Category
            Padding(
              padding: const EdgeInsets.only(left: 1.0),
              child: Text(
                "Sub Category",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Raleway',
                    color: textColor),
              ),
            ),
            //DropDownSub Category
            dropDownSubCategoryButton(),
            //Tags Title
            Padding(
              padding: const EdgeInsets.only(left: 1.0),
              child: Text.rich(
                TextSpan(
                    text: "Tags",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Raleway',
                        color: textColor),
                    children: const [
                      TextSpan(
                        text: " * ",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
              ),
            ),
            //Tags Field.
            buildTagField(),
            //Apply Filter
            buildApplyFilterButton(context)
          ],
        ),
      ),
    );
  }

  buildApplyFilterButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .05, right: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(78),
                  color: primaryColor,
                ),
                height: 48,
                width: 241,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48.0),
                      ),
                    ),
                    child: const Text(
                      "Apply Filter",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding buildTagField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 18.0, 0.0),
      child: Content(
        child: ChipsChoice<String>.multiple(
          value: tags,
          onChanged: (val) => {setState(() => tags = val)},
          choiceItems: C2Choice.listFrom<String, String>(
            source: options,
            value: (i, v) => v,
            label: (i, v) => v,
          ),
          alignment: WrapAlignment.spaceBetween,
          runAlignment: WrapAlignment.start,
          mainAxisSize: MainAxisSize.max,
          // runSpacing: 2.0,
          // spacing: 8.0,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          clipBehavior: Clip.hardEdge,
          padding: const EdgeInsets.symmetric(horizontal: 04, vertical: 8.0),

          // padding: const EdgeInsets.fromLTRB(15, 13, 8.5, 13),
          choiceActiveStyle: C2ChoiceStyle(
              pressElevation: 0,
              elevation: 0,
              // padding: EdgeInsets.all(0),
              margin: EdgeInsets.symmetric(vertical: 07.0),
              // margin: const EdgeInsets.symmetric(vertical: 5.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
              showCheckmark: false,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              labelPadding: EdgeInsets.zero,
              labelStyle: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700),
              backgroundColor: cardColor,
              color: textColor,
              borderColor: Colors.transparent,
              borderWidth: 0.0),
          choiceStyle: C2ChoiceStyle(
              clipBehavior: Clip.hardEdge,
              pressElevation: 0,
              elevation: 0,
              labelPadding: EdgeInsets.zero,
              labelStyle: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700),
              // margin: const EdgeInsets.symmetric(vertical: 5.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
              showCheckmark: false,
              color: textColor,
              disabledColor: Colors.grey[200],
              borderColor: Colors.transparent,
              borderWidth: 0.0),
          wrapped: true,
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }

  Padding dropDownCategoryButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 18.0, 20.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: 06),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: DropDownMultiSelect(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (List<String> x) {
                  setState(() {
                    categorySelected = x;
                  });
                },
                options: const [
                  'category 1',
                  'category 2',
                  'category 3',
                  'category 4',
                  // 'category 1',
                  // 'category 2',
                  // 'category 3',
                ],
                selectedValues: categorySelected,
                whenEmpty: 'Category',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding dropDownSubCategoryButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 18.0, 20.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: 06),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: DropDownMultiSelect(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (List<String> x) {
                  setState(() {
                    subCategorySelected = x;
                  });
                },
                options: const [
                  'Sub category 1',
                  'Sub category 2',
                  'Sub category 3',
                  'Sub category 4',
                  // 'Sub category 1',
                  // 'Sub category 2',
                  // 'Sub category 3',
                ],
                selectedValues: subCategorySelected,
                whenEmpty: 'Sub Category',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Content extends StatefulWidget {
  final Widget? child;

  const Content({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content>
    with AutomaticKeepAliveClientMixin<Content> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Wrap(
            children: [widget.child!],
            spacing: 12.0,
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.spaceBetween,
            runSpacing: 12.0,
          ),
        ],
      ),
    );
  }
}
