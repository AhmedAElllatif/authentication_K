import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poffeh_app/helper/cache_helper.dart';
import 'package:poffeh_app/routes/routes.dart';
import 'package:poffeh_app/utility/all_app_words.dart';
import '../../components/button/button.dart';
import '../../utility/app_theme.dart';

class SplashScreen extends StatelessWidget {
  //k
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(image: AssetImage(AppImage.splash),
                width:0.8.sw,
                height: 0.4.sh,
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(
            height: 0.12.sh,
          ),
         Padding(
           padding:  EdgeInsets.all(16.sp),
           child: Column(
             children: [
               Image(image: AssetImage(AppImage.logo),
                 width: 0.2.sw,
                 height:0.1.sh,
                 fit: BoxFit.fill,
               ),SizedBox(
                 height: 15.h,
               ),
                Text('Get Start Now',style: TextStyle(
                 fontSize: 25.sp,
                 fontWeight: FontWeight.w400,
               )),
               SizedBox(
                 height: 15.h,
               ),
               Text('We show the easy way to shop just stay where you are',
                   textAlign: TextAlign.center
                   ,style: TextStyle(
                     fontSize: 20.sp,
                     fontWeight: FontWeight.w400,
                   )),
               SizedBox(
                 height: 20.h,
               ),
               CustomButton(width: 0.7.sw,fontSize: 14.sp,color: AppColors.mainColor,
                 text:'Get Started Now',onPressed: (){
                 CacheHelper.saveData(key: 'splash', value: true).then((value) {
                   if(value){
                     goToScreen(screenNames: ScreenNames.loginScreen);
                   }
                 });
               },),
             ],
           ),
         )
          // last
        ],
      ),
    );
  }
}

