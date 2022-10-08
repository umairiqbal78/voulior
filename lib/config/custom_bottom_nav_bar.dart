// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// import 'package:vouloir/pages/chats_screens/chat_view.dart';
// import 'package:vouloir/pages/createarticlescreens/requirementscreen.dart';

// import '../pages/home/view/home_page.dart';
// import '../pages/notifications_screens/notification.dart';
////not in use
// class MyBottomNavBar extends StatefulWidget {
//   const MyBottomNavBar({Key? key}) : super(key: key);

//   @override
//   State<MyBottomNavBar> createState() => _MyBottomNavBarState();
// }

// class _MyBottomNavBarState extends State<MyBottomNavBar> {
//   final PersistentTabController _controller =
//       PersistentTabController(initialIndex: 0);

//   List<Widget> _buildScreens() {
//     return const [
//       HomeScreen(),
//       CreateArticleRequirement(),
//       NotificationView(),
//       ChatView()
//     ];
//   }

//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       //Home
//       PersistentBottomNavBarItem(
//         icon: _controller.index == 0
//             ? Image.asset('assets/home_filled.png')
//             : Image.asset('assets/home.png'),
//       ),
//       //Create Article
//       PersistentBottomNavBarItem(
//         icon: _controller.index == 1
//             ? Image.asset('assets/create_filled.png')
//             : Image.asset('assets/create.png'),
//       ),
//       PersistentBottomNavBarItem(
//         icon: _controller.index == 2
//             ? Image.asset('assets/notif.png')
//             : Image.asset('assets/notif_filled.png'),
//       ),
//       PersistentBottomNavBarItem(
//         icon: _controller.index == 3
//             ? Image.asset('assets/chat.png')
//             : Image.asset('assets/chat.png'),
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       context,
//       controller: _controller,
//       screens: _buildScreens(),
//       items: _navBarsItems(),
//       confineInSafeArea: true,
//       backgroundColor: Colors.white, // Default is Colors.white.
//       handleAndroidBackButtonPress: true, // Default is true.
//       resizeToAvoidBottomInset:
//           true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//       stateManagement: true, // Default is true.
//       hideNavigationBarWhenKeyboardShows:
//           true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//       decoration: NavBarDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         colorBehindNavBar: Colors.white,
//       ),
//       popAllScreensOnTapOfSelectedTab: true,
//       popActionScreens: PopActionScreensType.all,
//       itemAnimationProperties: const ItemAnimationProperties(
//         // Navigation Bar's items animation properties.
//         duration: Duration(milliseconds: 200),
//         curve: Curves.ease,
//       ),
//       screenTransitionAnimation: const ScreenTransitionAnimation(
//         // Screen transition animation on change of selected tab.
//         animateTabTransition: true,
//         curve: Curves.ease,
//         duration: Duration(milliseconds: 200),
//       ),
//       navBarStyle:
//           NavBarStyle.style3, // Choose the nav bar style with this property.
//     );
//   }
// }
