import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vouloir/config/color_pallete.dart';
import 'package:vouloir/pages/home/model/home_page_model.dart';
import 'package:vouloir/pages/home/view/home_page.dart';

class MyParentWidget extends StatelessWidget {
  const MyParentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomePageModel(),
      // ignore: prefer_const_literals_to_create_immutables
      child: const HomeScreen(),
    );
  }
}
