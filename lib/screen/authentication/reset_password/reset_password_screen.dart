import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poffeh_app/screen/authentication/reset_password/reset_password_view_model.dart';

import '../../../components/button/button.dart';
import '../../../components/text/custom_text.dart';
import '../../../components/text_field/text_field_custom.dart';
import '../../../cubits/generic_cubit/generic_cubit.dart';
import '../../../helper/validation.dart';
import '../../../routes/routes.dart';
import '../../../utility/all_app_words.dart';
import '../../../utility/app_theme.dart';


class ResetPasswordScreen extends StatelessWidget {
  final String userName;
  ResetPasswordScreen(this.userName, {super.key});
  ResetPasswordViewModel resetPasswordViewModel = ResetPasswordViewModel();
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
          padding: EdgeInsets.all(14.0.sp),
          child: SingleChildScrollView(
            child: Form(
              key: resetPasswordViewModel.formKey,
              child: Column(
                children: [
                  CustomText(
                      text: LLogin.passwordC,
                      color: AppColors.mainColor,
                      fontSize: 20.sp,
                      fontFamily: AppFonts.fontBold),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                    controller: resetPasswordViewModel.passwordController,
                    hintText: LLogin.password,
                    labelText: '',
                    obscureText: true,
                    inputType: TextInputType.text,
                    textFieldVaidType: TextFieldvalidatorType.Password,
                  ),
                  CustomTextField(
                    controller: resetPasswordViewModel.passwordAgainController,
                    hintText: LLogin.password_again,
                    labelText: '',
                    confirmPasswordController: resetPasswordViewModel.passwordController,
                    obscureText: true,
                    inputType: TextInputType.text,
                    textFieldVaidType: TextFieldvalidatorType.ConfirmPassword,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocConsumer<GenericCubit<bool>, GenericState<bool>>(
                    bloc: resetPasswordViewModel.getResetPassword,
                    listener: (context, state) {},
                    builder: (context, state) {
                      return state.data! ? const CircularProgressIndicator() : CustomButton(
                        fontSize: 14.sp,
                        color: AppColors.mainColor,
                        text: LLogin.password_again,
                        onPressed: () {
                          if (resetPasswordViewModel.formKey.currentState!.validate()) {
                           resetPasswordViewModel.resetPassword(userName);
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