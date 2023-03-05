import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poffeh_app/components/button/button.dart';
import 'package:poffeh_app/components/text_field/text_field_custom.dart';
import 'package:poffeh_app/helper/validation.dart';
import 'package:poffeh_app/screen/add_department/cubit/cubit.dart';
import 'package:poffeh_app/screen/add_department/cubit/states.dart';
import '../../components/text/custom_text.dart';
import '../../routes/routes.dart';
import '../../utility/all_app_words.dart';
import '../../utility/app_theme.dart';

class AddDepartmentScreen extends StatelessWidget {
  static const routeName = 'AddDepartmentScreen';
  var deptController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AddDepartmentCubit(),
  child: BlocConsumer<AddDepartmentCubit, AddDepartmentStates>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: AppWords.add_departments, color: AppColors.black,
            fontSize: 16.sp, fontFamily: AppFonts.fontBold),
        leading: IconButton(onPressed: (){
          goBack();
        },
            icon: Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                AddDepartmentCubit.get(context).image == null ? InkWell(
                  onTap: (){
                    AddDepartmentCubit.get(context).getImage();
                  },
                  child: Container(
                    width: 1.sw,
                    height: 0.23.sh,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.GreyColor,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AppImage.add_photo,width: 20.w,height: 20.h,),
                        ),
                        CustomText(text: AppWords.add_photo, color: AppColors.grey,
                            fontSize: 14.sp, fontFamily: AppFonts.fontMedium)
                      ],
                    ),
                  ),
                ) : Container(
                  width: 1.sw,
                  height: 0.23.sh,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    image: DecorationImage(
                      image: FileImage(AddDepartmentCubit.get(context).image!),fit: BoxFit.cover
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(controller: deptController, inputType: TextInputType.text,
                    labelText: '', hintText: AppWords.departments_name, textFieldVaidType: TextFieldvalidatorType.DisplayText),
                SizedBox(
                  height: 25.h,
                ),
                CustomButton(
                  width: 0.7.sw,
                  text: AppWords.add_departments,
                  onPressed: (){
                    if(formKey.currentState!.validate()){

                    }
                  },
                  color: AppColors.mainColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  },
),
);
  }
}
