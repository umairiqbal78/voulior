import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vouloir/Routes/app_pages.dart';
import 'package:vouloir/config/bottom_nav_bar.dart';
import 'package:vouloir/config/color_pallete.dart';
import 'package:vouloir/pages/auth/loginscreen.dart';
import 'package:vouloir/pages/auth/signupscreen.dart';
import 'package:vouloir/pages/auth/welcomescreen.dart';
import 'package:vouloir/pages/chats_screens/chat_view.dart';
import 'package:vouloir/pages/chats_screens/inbox.dart';
import 'package:vouloir/pages/createarticlescreens/requirementscreen.dart';
import 'package:vouloir/pages/home/view/article_detail_view.dart';
import 'package:vouloir/pages/home/view/postprop.dart';
import 'package:vouloir/pages/home/view/provider_home_page.dart';
import 'package:vouloir/pages/my_article_screen/view/my_article_singleview.dart';
import 'package:vouloir/pages/my_article_screen/view/my_articles_screen.dart';
import 'package:vouloir/pages/my_article_screen/view/profile/profileabout.dart';
import 'package:vouloir/pages/notifications_screens/notification.dart';
import 'package:vouloir/pages/my_article_screen/view/subscription/subscription.dart';
import 'package:vouloir/pages/updateprofile/updateProfile.dart';

void main() async {
  await GetStorage.init();
  runApp(
    const MyApp(),
  );
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Raleway',
        highlightColor: primaryColor,
        scaffoldBackgroundColor:
            buildMaterialColor(const Color.fromRGBO(245, 245, 245, 1)),
        appBarTheme: const AppBarTheme(
            shadowColor: Colors.transparent,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontFamily: "Raleway",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0,
            ),
            color: Color.fromRGBO(245, 245, 245, 1),
            centerTitle: true,
            toolbarHeight: 56),
        primarySwatch: buildMaterialColor(
          const Color.fromRGBO(54, 48, 98, 1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: Routes.welcome,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/welcome': (context) => const WelcomeScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/login': (context) => const LoginScreen(),
        '/bottomnavbar': (context) => CustomBottomNavigationBar(),
        '/0': (context) => const MyParentWidget(),
        '/1': (context) => const CreateArticleRequirement(),
        '/2': (context) => const NotificationView(),
        '/3': (context) => const ChatView(),
        '/MyArticlesScreen': (context) => const MyArticleScreen(),
        '/MyArticleSingleViewScreen': (context) =>
            const MyArticleSingleViewScreen(),
        '/ProfileAbout': (context) => ProfileAbout(),
        '/ArticleDetailViewScreen': (context) =>
            const ArticleDetailViewScreen(),
        '/PostPropScreen': (context) => const PostPropScreen(),
        '/UpdateProfileScreen': (context) => const UpdateProfileScreen(),
        '/SubscriptionScreen': (context) => const SubscriptionScreen(),
        '/inboxScreen': (context) => const InboxScreen(),
      },
    );
  }
}
