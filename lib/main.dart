import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poffeh_app/routes/routes.dart';
import 'package:poffeh_app/utility/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 761),//for ScreenUtilInit ,(375, 761) from xd
      minTextAdapt: true,//for ScreenUtilInit ,true daeman
      splitScreenMode: true,//for ScreenUtilInit ,true daeman
      builder: (context , child) { //for ScreenUtilInit
        return GetMaterialApp(
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          routes: appRoutes(context), //appRoutes() is method in routes.dart file (dont forget to import get: ^4.6.5 and convert MaterialApp to GetMaterialApp)
          initialRoute:  ScreenNames.defaultscreen, //first screen in the app
        );
      }
    );
  }
}

