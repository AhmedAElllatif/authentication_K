import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poffeh_app/routes/routes.dart';
import 'package:poffeh_app/screen/authentication/login/login_screen.dart';
import 'package:poffeh_app/screen/home/home_screen.dart';
import 'package:poffeh_app/screen/splash/splash_screen.dart';
import 'package:poffeh_app/utility/app_theme.dart';
import 'package:poffeh_app/utility/local_storge_key.dart';
import 'helper/cache_helper.dart';
import 'helper/helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();  //lAn ba await ala CacheHelper.init() lazem el main ybka async we lAn el main bka async lazwm adef el method...> WidgetsFlutterBinding.ensureInitialized()
  Helper.init();
  token = CacheHelper.getData(key: 'token');
  bool? splash = CacheHelper.getData(key: 'splash');
  String startWidget;
  if(splash != null){
    if(token != null){
      startWidget = ScreenNames.homeScreen;
    }else{
      startWidget = ScreenNames.loginScreen;
    }
  }else{
    startWidget = ScreenNames.defaultscreen;
  }
  runApp(MyApp(
    startWidget: startWidget,
  ));
}

class MyApp extends StatelessWidget {
  final String startWidget;
  const MyApp({super.key,required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 761),//for ScreenUtilInit ,(375, 761) from xd
      minTextAdapt: true,//for ScreenUtilInit ,true daeman
      splitScreenMode: true,//for ScreenUtilInit ,true daeman
      builder: (context , child) { //for ScreenUtilInit
        return GetMaterialApp(
          locale: const Locale("ar"),
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          routes: appRoutes(context), //appRoutes() is method in routes.dart file (dont forget to import get: ^4.6.5 and convert MaterialApp to GetMaterialApp)
          initialRoute:  startWidget, //first screen in the app
        );
      }
    );
  }
}

