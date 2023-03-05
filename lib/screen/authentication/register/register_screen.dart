import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poffeh_app/components/text/custom_text.dart';
import 'package:poffeh_app/cubits/generic_cubit/generic_cubit.dart';
import 'package:poffeh_app/screen/authentication/register/register_view_model.dart';

import '../../../components/button/button.dart';
import '../../../components/text_field/text_field_custom.dart';
import '../../../helper/validation.dart';
import '../../../routes/routes.dart';
import '../../../utility/all_app_words.dart';
import '../../../utility/app_theme.dart';


class RegisterScreen extends StatelessWidget {
  RegisterViewModel registerViewModel = RegisterViewModel();

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
            padding:  EdgeInsets.all(8.sp),
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
          padding: EdgeInsets.all(14.0.sp),
          child: SingleChildScrollView(
            child: Form(
              key: registerViewModel.formKey,
              child: Column(
                children: [
                  CustomText(
                      text: LLogin.welcome,
                      color: AppColors.mainColor,
                      fontSize: 20.sp,
                      fontFamily: AppFonts.fontBold),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
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
                    controller:
                    registerViewModel.userNameController,
                    hintText: LLogin.user_name,
                    labelText: '',
                    inputType: TextInputType.name,
                    textFieldVaidType: TextFieldvalidatorType.DisplayText,
                  ),
                  CustomTextField(
                    controller: registerViewModel.nameController,
                    hintText: LLogin.name,
                    labelText: '',
                    inputType: TextInputType.name,
                    textFieldVaidType: TextFieldvalidatorType.DisplayText,
                  ),
                  CustomTextField(
                      controller:
                      registerViewModel.emailController,
                      inputType: TextInputType.emailAddress,
                      labelText: '',
                      hintText: LLogin.email,
                      textFieldVaidType: TextFieldvalidatorType.Email),
                  CustomTextField(
                      controller:
                      registerViewModel.phoneController,
                      inputType: TextInputType.phone,
                      labelText: '',
                      hintText: LLogin.phone,
                      textFieldVaidType: TextFieldvalidatorType.Number),
                  CustomTextField(
                    controller:
                    registerViewModel.passwordController,
                    hintText: LLogin.password,
                    labelText: '',
                    obscureText: true,
                    inputType: TextInputType.text,
                    textFieldVaidType: TextFieldvalidatorType.Password,
                  ),
                  CustomTextField(
                    controller: registerViewModel.passwordAgainController,
                    hintText: LLogin.password_again,
                    labelText: '',
                    confirmPasswordController:
                    registerViewModel.passwordController,
                    obscureText: true,
                    inputType: TextInputType.text,
                    textFieldVaidType:
                    TextFieldvalidatorType.ConfirmPassword,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocConsumer<GenericCubit<bool>, GenericState<bool>>(
                    bloc: registerViewModel.getRegisterCubit,
                    listener: (context, state) {},
                    builder: (context, state) {
                      return state.data!
                          ? const CircularProgressIndicator() : CustomButton(
                        fontSize: 14.sp,
                        color: AppColors.mainColor,
                        text: LLogin.register,
                        onPressed: () {
                          if (registerViewModel.formKey
                              .currentState!
                              .validate()) {
                            registerViewModel.register();
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
