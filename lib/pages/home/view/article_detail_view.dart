import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vouloir/Routes/app_pages.dart';
import 'package:vouloir/config/app_bar.dart';
import 'package:vouloir/pages/home/widgets/home_art_single_view_properites.dart';

import '../../../config/color_pallete.dart';

class ArticleDetailViewScreen extends StatefulWidget {
  const ArticleDetailViewScreen({Key? key}) : super(key: key);

  @override
  State<ArticleDetailViewScreen> createState() =>
      _ArticleDetailViewScreenState();
}

class _ArticleDetailViewScreenState extends State<ArticleDetailViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarwithLeading(context, "Details"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Google Ads and PPC Marketing Expert",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: "Raleway",
                    fontSize: 18.0),
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                color: textColor.withOpacity(0.2),
                height: 1.0,
                thickness: 1.0,
              ),
              const SizedBox(
                height: 16.0,
              ),

              //
              HomeArticleSingleViewProperties(),

              const SizedBox(
                height: 50.0,
              ),
              const PostPropButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class PostPropButton extends StatelessWidget {
  const PostPropButton({
    Key? key,
  }) : super(key: key);

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
          width: MediaQuery.of(context).size.width * 0.75,
          child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.postPropScreen);
                // // if (_formKey.currentState!.validate()) {
                // //   Navigator.push(
                // //       context,
                // //       MaterialPageRoute(
                // //           builder: (context) => CreateArticleSpecifics(
                // //                 value: _value,
                // //               )));
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
              child: const Text(
                "Post Prop",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )),
        ),
      ),
    );
  }
}
