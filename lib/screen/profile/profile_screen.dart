import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/text/custom_text.dart';
import '../../routes/routes.dart';
import '../../utility/all_app_words.dart';
import '../../utility/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: AppWords.employee_details, color: AppColors.black,
            fontSize: 16.sp, fontFamily: AppFonts.fontBold),
        leading: IconButton(onPressed: (){
          goBack();
        },
            icon: Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: 40.r,
            )
          ],
        ),
      ),
    );
  }
}
