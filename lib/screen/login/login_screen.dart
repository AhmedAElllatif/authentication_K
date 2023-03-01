import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poffeh_app/components/text/custom_text.dart';
import 'package:poffeh_app/routes/routes.dart';
import 'package:poffeh_app/utility/app_theme.dart';

import '../../components/button/button.dart';

class LoginScreen extends StatelessWidget {
  static const routeName ='LoginScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(image: AssetImage('assets/img/logo.png'),
            width: 49.w,
            height: 34.h,
            fit: BoxFit.fill,
          ),
        ),
        actions: [
          IconButton(onPressed: (){
          goBack();
          },
              icon: Icon(Icons.arrow_forward_ios,color: Colors.black,))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomText(text: 'مرحبا بك', color: AppColors.mainColor, fontSize: 20.sp, fontFamily: AppFonts.fontBold),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomText(text: 'سجل دخولك بواسطة اسم المستخدم وكلمة السر وتمتع معنا بتطبيق المطبخ', color: AppColors.black, fontSize: 14.sp, fontFamily: AppFonts.fontBold,textAlign: TextAlign.center,),
                ),

                CustomButton(
                  fontSize: 14.sp,
                  color: AppColors.mainColor,
                  text:'تسجيل الدخول',
                  onPressed: (){
                  goToScreenpopAndPushNamed(screenNames: ScreenNames.loginScreen);
                },)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
