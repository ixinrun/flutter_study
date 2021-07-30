import 'package:ehi_school/modules/login/login_page.dart';
import 'package:ehi_school/modules/main/main_page.dart';
import 'package:ehi_school/modules/welcome/welcome_page.dart';

/// 静态路由
var staticRoutes = {
  WelcomePage.routeName: (context) => WelcomePage(),
  LoginPage.routeName: (context) => LoginPage(),
  MainPage.routeName: (context) => MainPage(),
};
