import 'package:get/get.dart';
import 'package:vouloir/config/bottom_nav_bar.dart';
import 'package:vouloir/pages/auth/loginscreen.dart';
import 'package:vouloir/pages/auth/signupscreen.dart';
import 'package:vouloir/pages/auth/welcomescreen.dart';
import 'package:vouloir/pages/chats_screens/chat_view.dart';
import 'package:vouloir/pages/chats_screens/inbox.dart';
import 'package:vouloir/pages/createarticlescreens/requirementscreen.dart';
import 'package:vouloir/pages/createarticlescreens/specifics.dart';
import 'package:vouloir/pages/home/view/article_detail_view.dart';
import 'package:vouloir/pages/home/view/postprop.dart';
import 'package:vouloir/pages/home/view/provider_home_page.dart';
import 'package:vouloir/pages/my_article_screen/view/my_article_singleview.dart';
import 'package:vouloir/pages/my_article_screen/view/my_articles_screen.dart';
import 'package:vouloir/pages/my_article_screen/view/profile/profileabout.dart';
import 'package:vouloir/pages/my_article_screen/view/subscription/subscription.dart';
import 'package:vouloir/pages/notifications_screens/notification.dart';
import 'package:vouloir/pages/updateprofile/updateProfile.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.welcome;

  static final routes = [
    GetPage(
        name: _Paths.welcomeScreen,
        page: () => const WelcomeScreen(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 300)),
    // transition: Transition.leftToRight,
    // transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: _Paths.customBottomNavBar,
        page: () => CustomBottomNavigationBar(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: _Paths.signUpScreen,
        page: () => const SignUpScreen(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: _Paths.loginScreen,
        page: () => const LoginScreen(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: _Paths.homeScreen,
        page: () => const MyParentWidget(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: _Paths.articleDetailViewScreen,
        page: () => const ArticleDetailViewScreen(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: _Paths.createArticleRequirement,
        page: () => const CreateArticleRequirement(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
      name: _Paths.notificationView,
      page: () => const NotificationView(),
    ),
    GetPage(
      name: _Paths.chatView,
      page: () => const ChatView(),
    ),
    GetPage(
        name: _Paths.myArticlesScreen,
        page: () => const MyArticleScreen(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: _Paths.myArticleSingleViewScreen,
        page: () => const MyArticleSingleViewScreen(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: _Paths.profileAbout,
        page: () => ProfileAbout(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: _Paths.postPropScreen,
        page: () => const PostPropScreen(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: _Paths.updateProfileScreen,
        page: () => const UpdateProfileScreen(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
      name: _Paths.subscriptionScreen,
      page: () => const SubscriptionScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.inboxScreen,
      page: () => const InboxScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}