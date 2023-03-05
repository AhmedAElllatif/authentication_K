import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poffeh_app/components/text/custom_text.dart';
import 'package:poffeh_app/routes/routes.dart';
import 'package:poffeh_app/utility/all_app_words.dart';
import 'package:poffeh_app/utility/app_theme.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.menu,size: 25,),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundImage: AssetImage(AppImage.splash),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(maxLines: 1,text: 'kareem', color: AppColors.black,
                            fontSize: 18.sp, fontFamily: AppFonts.fontBold),
                        CustomText(maxLines: 1,text: 'EXCP', color: AppColors.mainColor,
                            fontSize: 16.sp, fontFamily: AppFonts.fontMedium),
                      ],
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: (){
                goToScreen(screenNames: ScreenNames.homeScreen);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    SvgPicture.asset(AppImage.home,width: 25.w,height: 23.h,),
                    SizedBox(width: 10.w,),
                    CustomText(text: AppWords.home, color: AppColors.black,
                        fontSize: 16.sp, fontFamily: AppFonts.fontMedium),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
//                goToScreen(screenNames: ScreenNames.homeScreen);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    SvgPicture.asset(AppImage.person,width: 25.w,height: 23.h,),
                    SizedBox(width: 10.w,),
                    CustomText(text: AppWords.profile, color: AppColors.black,
                        fontSize: 16.sp, fontFamily: AppFonts.fontMedium),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                goToScreen(screenNames: ScreenNames.loginScreen);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    SvgPicture.asset(AppImage.out,width: 25.w,height: 23.h,),
                    SizedBox(width: 10.w,),
                    CustomText(text: AppWords.log, color: AppColors.black,
                        fontSize: 16.sp, fontFamily: AppFonts.fontMedium),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
