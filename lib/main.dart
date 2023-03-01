import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poffeh_app/routes/routes.dart';
import 'package:poffeh_app/screen/splash/splash_screen.dart';
import 'package:poffeh_app/utility/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 761),//from xd
      minTextAdapt: true,//true daeman
      splitScreenMode: true,//true daeman
      builder: (context , child) {
        return GetMaterialApp(
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          routes: appRoutes(context), //method in routes.dart file
          initialRoute:  ScreenNames.defaultscreen,
//          initialRoute:  ScreenNames.loginScreen

        );
      }
    );
  }
}

