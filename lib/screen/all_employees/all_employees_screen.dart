import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poffeh_app/screen/all_employees/components/employee_item.dart';

import '../../components/text/custom_text.dart';
import '../../routes/routes.dart';
import '../../utility/all_app_words.dart';
import '../../utility/app_theme.dart';

class AllEployeesScreen extends StatelessWidget {
  static const routeName = 'AllEployeesScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: AppWords.employees, color: AppColors.black,
            fontSize: 16.sp, fontFamily: AppFonts.fontBold),
        leading: IconButton(onPressed: (){
          goBack();
        },
            icon: Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 6.0,
          mainAxisSpacing: 6.0,
          childAspectRatio: 1.2/1,
          children: List.generate(20, (index) => EmployeeItem()),
        ),
      ),

    );
  }
}
