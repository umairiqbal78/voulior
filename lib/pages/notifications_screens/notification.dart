import 'package:flutter/material.dart';
import 'package:vouloir/config/app_bar.dart';
import 'package:vouloir/config/bottom_nav_bar.dart';
import 'package:vouloir/config/color_pallete.dart';
import 'package:vouloir/config/drawer.dart';
import 'package:vouloir/config/textstyle.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<NotificationCard> notificationCard = [
    NotificationCard(
        imageAvatar: true,
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        timeAgo: '15 min ago',
        respond: true,
        unread: true),
    NotificationCard(
        imageAvatar: false,
        icon: const Icon(
          Icons.visibility_outlined,
          size: 20,
          color: Colors.white,
        ),
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        timeAgo: 'Nov 21',
        respond: false,
        unread: false),
    NotificationCard(
        imageAvatar: false,
        icon: const Icon(
          Icons.do_disturb_alt_rounded,
          size: 20,
          color: Colors.white,
        ),
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        timeAgo: 'July 21',
        respond: true,
        unread: true),
    NotificationCard(
        imageAvatar: false,
        icon: const Icon(
          Icons.wallet_giftcard,
          size: 20,
          color: Colors.white,
        ),
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        timeAgo: 'July 21',
        respond: true,
        unread: true)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      key: scaffoldKey,
      drawerScrimColor: Colors.transparent,
      drawer: const DrawerWidget(),
      appBar: appBarBuiltMethod(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24.0,
              ),
              Text(
                "Today",
                style: ralewayStyle(16, FontWeight.w600, textColor),
              ),
              const SizedBox(
                height: 18,
              ),
              ListView.separated(
                separatorBuilder: (context, index) => Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Divider(
                      height: 1.0,
                      color: textColor.withOpacity(0.2),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) =>
                    notificationShowWidget(notificationCard[index]),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                "Earlier",
                style: ralewayStyle(16, FontWeight.w600, textColor),
              ),
              const SizedBox(
                height: 18,
              ),
              ListView.separated(
                separatorBuilder: (context, index) => Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Divider(
                      height: 1.0,
                      color: textColor.withOpacity(0.2),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: notificationCard.length,
                itemBuilder: (context, index) =>
                    notificationShowWidget(notificationCard[index]),
              ),
              const SizedBox(
                height: 30.0,
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 2),
    );
  }

  Container notificationShowWidget(NotificationCard notificationCard) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 38,
            width: 37,
            decoration: notificationCard.imageAvatar
                ? const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/hasnain.png'),
                    ),
                  )
                : BoxDecoration(color: primaryColor, shape: BoxShape.circle),
            child: notificationCard.icon,
          ),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(
                          text: notificationCard.content,
                          style:
                              ralewayStyle(14, FontWeight.w400, neutralsDark2),
                          children: <InlineSpan>[
                            const TextSpan(text: " "),
                            TextSpan(
                              text: notificationCard.timeAgo,
                              style: ralewayStyle(
                                  12, FontWeight.w400, neutralsGrey1),
                            )
                          ])),
                      const SizedBox(
                        height: 14,
                      ),
                      notificationCard.respond
                          ? Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: neutrals_softgrey,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(40.0)),
                              padding:
                                  const EdgeInsets.fromLTRB(21, 8.0, 25, 8.0),
                              child: Text(
                                "Respond",
                                style: ralewayStyle(
                                  12,
                                  FontWeight.w500,
                                  primaryColor,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ))),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: notificationCard.unread
                    ? const Color.fromRGBO(56, 193, 136, 1)
                    : neutrals_softgrey,
              ),
            ),
          ),
        ],
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
      title: const Text(
        "Notifications",
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Clear all',
              style: ralewayStyle(14, FontWeight.w700, secColor),
            ),
          ),
        )
      ],
    );
  }
}

class NotificationCard {
  bool imageAvatar;
  Icon? icon;
  String content;
  String timeAgo;
  bool respond;
  bool unread;

  NotificationCard({
    required this.imageAvatar,
    required this.content,
    required this.timeAgo,
    required this.respond,
    required this.unread,
    this.icon,
  });
}
