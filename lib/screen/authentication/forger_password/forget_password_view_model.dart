import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poffeh_app/components/my_toast/my_toast.dart';
import 'package:poffeh_app/cubits/generic_cubit/generic_cubit.dart';
import 'package:poffeh_app/utility/app_theme.dart';

import '../../../helper/helper.dart';
import '../../../models/forget_password_model.dart';
import '../ensure_password/ensure_password_screen.dart';

class ForgetPasswordViewModel{
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GenericCubit<bool> getPassword = GenericCubit(data: false);

  ForgetPasswordModel? forgetPasswordModel;
  void forget(){
    getPassword.update(data: true);
    Helper.postData(url: 'Account/ForgotPassword', data: {
      'Username' : nameController.text,
    }).then((value) {
      forgetPasswordModel = ForgetPasswordModel.fromJson(value.data);
      getPassword.update(data: false);
      if (forgetPasswordModel!.state!) {
        Navigator.push(
            Get.context!,
            MaterialPageRoute(
                builder: (context) => EnsurePasswordScreen(
                    id: forgetPasswordModel!.data!.applicationUser!.id!,
                    userName: forgetPasswordModel!.data!.applicationUser!.userName!)));
      } else {
        showToast(msg: forgetPasswordModel!.message![0].value!, backgroundColor: AppColors.red);
      }
    }).catchError((error){
      getPassword.update(data: false);
    });
  }
}