import 'package:flutter/material.dart';
import 'package:vouloir/config/color_pallete.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class CustomCustomBottomNavigationBar extends StatefulWidget {
//   const CustomCustomBottomNavigationBar({Key? key, required this.selectedIndex})
//       : super(key: key);
//   final int selectedIndex;
//   @override
//   State<CustomCustomBottomNavigationBar> createState() =>
//       _CustomCustomBottomNavigationBartate();
// }

// class _CustomCustomBottomNavigationBartate extends State<CustomCustomBottomNavigationBar> {
//   int? _selectedItemIndex;
//   @override
//   void initState() {
//     super.initState();
//     _selectedItemIndex = widget.selectedIndex;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       height: 70,
//       width: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.zero,
//       decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(32), topRight: Radius.circular(32))),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           buildBottomNavBarItem(context, 'assets/home.svg',
//               'assets/home_filled.svg', 0, Colors.amber),
//           buildBottomNavBarItem(context, 'assets/create.svg',
//               'assets/create_filled.svg', 1, Colors.greenAccent),
//           buildBottomNavBarItem(context, 'assets/notif.svg',
//               'assets/notif_filled.svg', 2, Colors.blueAccent),
//           buildBottomNavBarItem(context, 'assets/chat.svg',
//               'assets/chat_filled.svg', 3, Colors.redAccent),
//         ],
//       ),
//     );
//   }

//   Widget buildBottomNavBarItem(BuildContext context, String asset,
//       String assetFilled, int index, Color color) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _selectedItemIndex = index;
//           Navigator.pushNamed(context, '/$index');
//         });
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(0.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             index == _selectedItemIndex
//                 ? Container(
//                     margin: EdgeInsets.zero,
//                     padding: EdgeInsets.zero,
//                     width: 24.0,
//                     height: 4.0,
//                     decoration: BoxDecoration(
//                       color: secColor,
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                   )
//                 : Container(),
//             index == 0
//                 ? Padding(
//                     padding: const EdgeInsets.only(
//                       top: 16.0,
//                     ),
//                     child: SvgPicture.asset(
//                       index == _selectedItemIndex ? assetFilled : asset,
//                     ))
//                 : index == 2
//                     ? Padding(
//                         padding: const EdgeInsets.only(top: 16.0, bottom: 18.0),
//                         child: SvgPicture.asset(
//                           index == _selectedItemIndex ? assetFilled : asset,
//                         ))
//                     : index == 1
//                         ? Padding(
//                             padding:
//                                 const EdgeInsets.only(top: 14.0, bottom: 26.0),
//                             child: SvgPicture.asset(
//                               index == _selectedItemIndex ? assetFilled : asset,
//                             ),
//                           )
//                         : Padding(
//                             padding:
//                                 const EdgeInsets.only(top: 18.0, bottom: 23.0),
//                             child: SvgPicture.asset(
//                               index == _selectedItemIndex ? assetFilled : asset,
//                             ),
//                           )
//           ],
//         ),
//       ),
//     );
//   }
// }
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vouloir/config/textstyle.dart';
import 'package:vouloir/pages/chats_screens/chat_view.dart';
import 'package:vouloir/pages/createarticlescreens/requirementscreen.dart';
import 'package:vouloir/pages/home/view/provider_home_page.dart';
import 'package:vouloir/pages/notifications_screens/notification.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  BottomController controller = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(() => IndexedStack(
            index: controller.selectedIndex.value,
            children: [
              MyParentWidget(),
              controller.selectedIndex.value == 1
                  ? CreateArticleRequirement()
                  : Container(),
              NotificationView(),
              controller.selectedIndex.value == 3 ? ChatView() : Container(),
            ],
          )),
      bottomNavigationBar: Obx(
        () => Container(
          height: kToolbarHeight * 1.1,
          decoration: BoxDecoration(color: Color(0xffffffff)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.selectedIndex.value = 0;
                  },
                  child: item(
                    controller.selectedIndex.value,
                    0,
                    'assets/home_filled.svg',
                    'assets/home.svg',
//
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.selectedIndex.value = 1;
                  },
                  child: item(
                    controller.selectedIndex.value,
                    1,
                    'assets/create_filled.svg',
                    'assets/create.svg',
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.selectedIndex.value = 2;
                  },
                  child: item(
                    controller.selectedIndex.value,
                    2,
                    'assets/notif_filled.svg',
                    'assets/notif.svg',
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.selectedIndex.value = 3;
                  },
                  child: item(
                    controller.selectedIndex.value,
                    3,
                    'assets/chat_filled.svg',
                    'assets/chat.svg',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column item(selectedIndex, currentIndex, assetFilled, asset) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 5.0,
          width: MediaQuery.of(context).size.width / 12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: selectedIndex == currentIndex ? secColor : Colors.white,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            currentIndex == 0
                ? selectedIndex == currentIndex
                    ? Image.asset('assets/home_filled.png')
                    : Image.asset('assets/home.png')
                : SvgPicture.asset(
                    selectedIndex == currentIndex ? assetFilled : asset,
                  ),
            // Icon(
            //   icon,
            //   color:
            //       selectedIndex == currentIndex ? primaryColor : primaryColor,
            // ),
            // Text(
            //   name,
            //   style: ralewayStyle(
            //     10,
            //     FontWeight.normal,
            //     selectedIndex == currentIndex ? primaryColor : primaryColor,
            //   ),
            // )
          ],
        ),
        SizedBox(
          height: kToolbarHeight * 0.10,
        )
      ],
    );
  }
}

/*
*  CustomBottomNavigationBar(

          selectedItemColor: DynamicColors.primaryColor,
          showUnselectedLabels: true,
          unselectedItemColor: DynamicColors.textColor,
          unselectedLabelStyle:
              AirbnbCereal_W_Bd(color: DynamicColors.textColor, fontSize: 12),
          selectedLabelStyle:
              AirbnbCereal_W_Bd(color: DynamicColors.textColor, fontSize: 12),
          items: <CustomBottomNavigationBarItem>[
            CustomBottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: "Explore",
            ),
            CustomBottomNavigationBarItem(
              icon: Icon(Icons.location_on_rounded),
              label: "Map",
            ),
            CustomBottomNavigationBarItem(
              icon: Icon(Icons.videogame_asset_rounded),
              label: "My Games",
            ),
            CustomBottomNavigationBarItem(
              icon: Icon(Icons.people_alt_rounded),
              label: "Social",
            ),
            CustomBottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
          currentIndex: controller.selectIndex,
          onTap: (index) {
            controller.selectIndex = index;
          },
        )*/
class BottomController extends GetxController with WidgetsBindingObserver {
  WidgetsBinding binding = WidgetsBinding.instance;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("state: $state");
  }

  @override
  void dispose() {
    binding.removeObserver(this);
    super.dispose();
  }

  @override
  void onInit() {
    binding.addObserver(this);
  }

  RxInt selectedIndex = 0.obs;
  get selectIndex => selectedIndex.value;
  set selectIndex(index) => selectedIndex.value = index;
}
