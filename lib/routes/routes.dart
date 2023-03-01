import 'package:poffeh_app/screen/splash/splash_screen.dart';

import '../screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'app_navigator.dart';


appRoutes(context) {

  var routes = {
    ScreenNames.defaultscreen: (context) => SplashScreen(),
    ScreenNames.loginScreen: (context) => LoginScreen(),

  };


  return routes;
}

class ScreenNames {
  static const String defaultscreen = "/";
  static String loginScreen = LoginScreen.routeName;
}
