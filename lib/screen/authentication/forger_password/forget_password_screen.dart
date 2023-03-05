import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poffeh_app/components/text/custom_text.dart';
import 'package:poffeh_app/cubits/generic_cubit/generic_cubit.dart';
import 'package:poffeh_app/routes/routes.dart';
import 'package:poffeh_app/utility/app_theme.dart';
import '../../../components/button/button.dart';
import '../../../components/text_field/text_field_custom.dart';
import '../../../helper/validation.dart';
import '../../../utility/all_app_words.dart';
import 'forget_password_view_model.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordViewModel forgetPasswordViewModel = ForgetPasswordViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              goBack();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: Image(
              image: const AssetImage(AppImage.logo),
              width: 49.w,
              height: 34.h,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Form(
              key: forgetPasswordViewModel.formKey,
              child: Column(
                children: [
                  CustomText(
                      text: LLogin.password_aagain,
                      color: AppColors.mainColor,
                      fontSize: 20.sp,
                      fontFamily: AppFonts.fontBold),
                  Padding(
                    padding: EdgeInsets.all(16.sp),
                    child: CustomText(
                      text: LLogin.password_again_desc,
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontFamily: AppFonts.fontBold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomTextField(
                    controller: forgetPasswordViewModel.nameController,
                    hintText: LLogin.user_name,
                    labelText: '',
                    inputType: TextInputType.name,
                    textFieldVaidType: TextFieldvalidatorType.DisplayText,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocConsumer<GenericCubit<bool>, GenericState<bool>>(
                    bloc: forgetPasswordViewModel.getPassword,
                    listener: (context, state) {
                    },
                    builder: (context, state) {
                      return state.data! ?const CircularProgressIndicator() :  CustomButton(
                        fontSize: 14.sp,
                        color: AppColors.mainColor,
                        text: LLogin.next,
                        onPressed: () {
                          if (forgetPasswordViewModel
                              .formKey.currentState!
                              .validate()) {
                            forgetPasswordViewModel.forget();
                          }
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
