import 'package:poffeh_app/screen/splash/splash_screen.dart';
import '../screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/register/register_screen.dart';
part 'app_navigator.dart';


appRoutes(context) {

  var routes = {
    ScreenNames.defaultscreen: (context) => SplashScreen(), //first screen in the app
    ScreenNames.loginScreen: (context) => LoginScreen(),
    ScreenNames.registerScreen: (context) => RegisterScreen(),

  };

  return routes;
}

class ScreenNames {
  static const String defaultscreen = "/"; //first screen in the app
  static String loginScreen = LoginScreen.routeName;
  static String registerScreen = RegisterScreen.routeName;
}
