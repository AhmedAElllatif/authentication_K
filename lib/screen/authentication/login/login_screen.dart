import 'package:flutter/cupertino.dart';
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
import 'login_view_model.dart';


class LoginScreen extends StatelessWidget {
  LoginViewModel loginViewModel = LoginViewModel();
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
              key: loginViewModel.formKey,
              child: Column(
                children: [
                  CustomText(
                      text: LLogin.welcome,
                      color: AppColors.mainColor,
                      fontSize: 20.sp,
                      fontFamily: AppFonts.fontBold),
                  Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: CustomText(
                      text: LLogin.welcome_desc,
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontFamily: AppFonts.fontBold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextField(
                    controller: loginViewModel.nameController,
                    hintText: LLogin.user_name,
                    labelText: '',
                    inputType: TextInputType.name,
                    textFieldVaidType: TextFieldvalidatorType.DisplayText,
                  ),
                  CustomTextField(
                    controller: loginViewModel.passwordController,
                    hintText: LLogin.password,
                    labelText: '',
                    obscureText: true,
                    inputType: TextInputType.text,
                    textFieldVaidType: TextFieldvalidatorType.Password,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocConsumer<GenericCubit<bool>, GenericState<bool>>(
                    bloc: loginViewModel.getLogin,
                    listener: (context, state) {
                    },
                    builder: (context, state) {
                      return state.data! ? const CircularProgressIndicator() : CustomButton(
                        fontSize: 14.sp,
                        color: AppColors.mainColor,
                        text: LLogin.login,
                        onPressed: () {
                          if (loginViewModel.formKey.currentState!.validate()) {
                            loginViewModel.login(rememberMe: 'true');
                          }
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () {
                      goToScreen(
                          screenNames: ScreenNames.forgetPasswordScreen);
                    },
                    child: CustomText(
                        text: LLogin.forget_password,
                        color: AppColors.Kbluecolor,
                        fontSize: 14.sp,
                        fontFamily: AppFonts.fontMedium),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 14.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                            text: LLogin.haveAccount,
                            color: AppColors.black,
                            fontSize: 14.sp,
                            fontFamily: AppFonts.fontMedium),
                        SizedBox(
                          width: 5.w,
                        ),
                        InkWell(
                          onTap: () {
                            goToScreen(
                                screenNames: ScreenNames.registerScreen);
                          },
                          child: CustomText(
                              text: LLogin.register,
                              color: AppColors.mainColor,
                              fontSize: 14.sp,
                              fontFamily: AppFonts.fontMedium),
                        ),
                      ],
                    ),
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
