part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const welcome = _Paths.welcomeScreen;

  static const customBottomNavBar = _Paths.customBottomNavBar;
  static const signUpScreen = _Paths.signUpScreen;
  static const loginScreen = _Paths.loginScreen;
  static const homeScreen = _Paths.homeScreen;
  static const createArticleRequirement = _Paths.createArticleRequirement;
  static const createArticleSpecifics = _Paths.createArticleSpecifics;
  static const notificationView = _Paths.notificationView;
  static const chatView = _Paths.chatView;
  static const myArticlesScreen = _Paths.myArticlesScreen;
  static const myArticleSingleViewScreen = _Paths.myArticleSingleViewScreen;
  static const profileAbout = _Paths.profileAbout;
  static const articleDetailViewScreen = _Paths.articleDetailViewScreen;
  static const postPropScreen = _Paths.postPropScreen;
  static const updateProfileScreen = _Paths.updateProfileScreen;
  static const subscriptionScreen = _Paths.subscriptionScreen;
  static const inboxScreen = _Paths.inboxScreen;
}

abstract class _Paths {
  static const welcomeScreen = '/welcome';
  static const customBottomNavBar = '/customBottomNavBar';
  static const signUpScreen = '/signUpScreen';
  static const loginScreen = '/loginScreen';
  static const homeScreen = '/homeScreen';
  static const createArticleRequirement = '/createArticleRequirement';
  static const createArticleSpecifics = '/createArticleSpecifics';
  static const notificationView = '/notificationView';
  static const chatView = '/chatView';
  static const myArticlesScreen = '/myArticlesScreen';
  static const myArticleSingleViewScreen = '/myArticleSingleViewScreen';
  static const articleDetailViewScreen = '/articleDetailViewScreen';

  static const profileAbout = '/profileAbout';
  static const postPropScreen = '/postPropScreen';
  static const updateProfileScreen = '/updateProfileScreen';
  static const subscriptionScreen = '/subscriptionScreen';
  static const inboxScreen = '/inboxScreen';
}
