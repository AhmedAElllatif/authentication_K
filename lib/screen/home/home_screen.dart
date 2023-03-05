import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poffeh_app/components/text/custom_text.dart';
import 'package:poffeh_app/routes/routes.dart';
import 'package:poffeh_app/screen/home/components/dept_item.dart';
import 'package:poffeh_app/screen/home/components/employee_item.dart';
import 'package:poffeh_app/utility/all_app_words.dart';
import 'package:poffeh_app/utility/app_theme.dart';

import 'components/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: AppWords.home, color: AppColors.black,
            fontSize: 16.sp, fontFamily: AppFonts.fontBold),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    CustomText(text: AppWords.departments, color: AppColors.black,
                        fontSize: 18.sp, fontFamily: AppFonts.fontBold),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        goToScreen(screenNames: ScreenNames.addDepartmentScreen);
                      },
                      child: CircleAvatar(
                        radius: 22.0,
                        backgroundColor: AppColors.mainColor,
                        child: Icon(Icons.add,color: AppColors.white,size: 20.0,),
                      ),
                    )
                  ],
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 6.0,
                childAspectRatio: 1.8/1,
                children: List.generate(8, (index) => DeptItem()),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  children: [
                    CustomText(text: AppWords.employees, color: AppColors.black,
                        fontSize: 18.sp, fontFamily: AppFonts.fontBold),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        goToScreen(screenNames: ScreenNames.allEployeesScreen);
                      },
                      child: CustomText(text: AppWords.all, color: AppColors.Kbluecolor,
                          fontSize: 18.sp, fontFamily: AppFonts.fontBold),
                    ),
                  ],
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 6.0,
                childAspectRatio: 1.2/1,
                children: List.generate(6, (index) => EmployeeItem()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
