import 'package:poffeh_app/screen/all_employees/all_employees_screen.dart';
import 'package:poffeh_app/screen/splash/splash_screen.dart';
import '../screen/add_department/add_department_screen.dart';
import '../screen/authentication/forger_password/forget_password_screen.dart';
import '../screen/authentication/login/login_screen.dart';
import '../screen/authentication/register/register_screen.dart';
import '../screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
part 'app_navigator.dart';

appRoutes(context) {

  var routes = {
    ScreenNames.defaultscreen: (context) => SplashScreen(), //first screen in the app
    ScreenNames.loginScreen: (context) => LoginScreen(),
    ScreenNames.registerScreen: (context) => RegisterScreen(),
    ScreenNames.homeScreen: (context) => HomeScreen(),
    ScreenNames.forgetPasswordScreen: (context) => ForgetPasswordScreen(),
    ScreenNames.allEployeesScreen:(context) => AllEployeesScreen(),
    ScreenNames.addDepartmentScreen:(context) => AddDepartmentScreen(),
  };

  return routes;
}

class ScreenNames {
  static const String defaultscreen = "/"; //first screen in the app
  static String loginScreen = 'LoginScreen';
  static String registerScreen = 'RegisterScreen';
  static String homeScreen = 'HomeScreen';
  static String forgetPasswordScreen = 'ForgetPasswordScreen';
  static String allEployeesScreen = 'AllEployeesScreen';
  static String addDepartmentScreen = 'AddDepartmentScreen';
}
