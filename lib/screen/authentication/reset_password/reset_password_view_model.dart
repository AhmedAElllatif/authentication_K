import 'package:flutter/material.dart';
import 'package:poffeh_app/components/my_toast/my_toast.dart';
import 'package:poffeh_app/cubits/generic_cubit/generic_cubit.dart';
import 'package:poffeh_app/helper/helper.dart';
import 'package:poffeh_app/models/reset_Password_model.dart';
import 'package:poffeh_app/routes/routes.dart';
import 'package:poffeh_app/utility/app_theme.dart';

class ResetPasswordViewModel{
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  GenericCubit<bool> getResetPassword = GenericCubit(data: false);
  
  ResetPasswordModel? resetPasswordModel;
  void resetPassword(String username){
    getResetPassword.update(data: true);
    Helper.postData(url: 'Account/ResetPassword', data: {
      'Username' : username,
      'Password' : passwordController.text,
      'ConfirmPassword' : passwordAgainController.text,
    }).then((value) {
      resetPasswordModel = ResetPasswordModel.fromJson(value.data);
      getResetPassword.update(data: false);
      if(resetPasswordModel!.state!){
        goToScreenpopAndPushNamed(screenNames: ScreenNames.loginScreen);
      }else{
        showToast(msg: resetPasswordModel!.message![0].value!, backgroundColor: AppColors.red);
      }
    }).catchError((error){
      getResetPassword.update(data: false);
    });
  }

}
