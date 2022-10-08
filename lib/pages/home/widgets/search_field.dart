import 'package:flutter/material.dart';

import '../../../config/color_pallete.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(40),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
            border: Border.all(
                width: 1, color: Colors.transparent, style: BorderStyle.solid)),
        child: TextField(
            decoration: InputDecoration(
                fillColor: const Color.fromRGBO(255, 255, 255, 1),
                prefixIcon: Image.asset('assets/search.png'),
                prefixIconColor: secColor.withOpacity(0.5),
                iconColor: secColor.withOpacity(0.5),
                focusColor: secColor,
                enabled: true,
                hintText: 'Search..',
                hintStyle: TextStyle(
                    fontFamily: 'Raleway',
                    color: secColor.withOpacity(0.5),
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0),
                contentPadding:
                    const EdgeInsets.only(left: 14, top: 14, bottom: 11),
                border: InputBorder.none),
            onChanged: ((value) => CustomSearchDelegate())),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
