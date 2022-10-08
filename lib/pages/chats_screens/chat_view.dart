import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vouloir/config/bottom_nav_bar.dart';
import 'package:vouloir/config/color_pallete.dart';
import 'package:vouloir/config/textstyle.dart';

import '../../Routes/app_pages.dart';
import '../../config/drawer.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        drawerScrimColor: Colors.transparent,
        drawer: const DrawerWidget(),
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        appBar: appBarWidget(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 39,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.inboxScreen);
                        },
                        child: messageTile(context)),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 30,
                        ),
                    itemCount: 3)
              ],
            ),
          ),
        ),
        // bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 3),
      ),
    );
  }

  Container messageTile(BuildContext context) {
    return Container(
      height: 48,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: 48,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/hasnain.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), //color of shadow
                      spreadRadius: 0, //spread radius
                      blurRadius: 4, // blur radius
                      offset: const Offset(0, 8), // changes position of shadow
                    ),
                  ],
                ),
              ),
              Container(
                height: 16,
                width: 16,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(245, 245, 245, 1)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF2CC069),
                    ),
                    height: 12,
                    width: 12,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 14.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Victoria Avila",
                style: ralewayStyle(14, FontWeight.w500, textColor),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.55,
                child: Text(
                  "That’s great, I look forward to hearing backThat’s great, I look forward to hearing back",
                  style: ralewayStyle(
                    11,
                    FontWeight.w500,
                    neutrals_softgrey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "11:20 am",
                style: ralewayStyle(12, FontWeight.w400, neutrals_softgrey),
              ),
              Container(
                alignment: Alignment.center,
                height: 20,
                width: 21,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: cardColor,
                ),
                child: Text(
                  "1",
                  style: ralewayStyle(
                    10,
                    FontWeight.w600,
                    primaryColor,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      centerTitle: true,
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
        "Inbox",
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        SvgPicture.asset('assets/chat_add.svg'),
        const SizedBox(
          width: 20.0,
        )
      ],
    );
  }
}
