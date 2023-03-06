import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poffeh_app/components/my_toast/my_toast.dart';
import 'package:poffeh_app/cubits/generic_cubit/generic_cubit.dart';
import 'package:poffeh_app/utility/app_theme.dart';
import '../../../helper/helper.dart';
import '../../../models/register_model.dart';
import '../ensuree/ensure_screen.dart';

class RegisterViewModel{
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  GenericCubit<bool> getRegisterCubit = GenericCubit(data: false);

  RegisterModel? registerModel;
  void register(){
    getRegisterCubit.update(data: true);
    Helper.postData(url: 'Account/Register', data: {
      'UserName':userNameController.text,
      'PhoneNumber':phoneController.text,
      'Email':emailController.text,
      'Name':nameController.text,
      'Role':'Admin',
      'Password':passwordController.text,
      'ConfirmPassword':passwordAgainController.text,
    }).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      getRegisterCubit.update(data: false);
      if(registerModel!.state!){
        Navigator.push(Get.context!, MaterialPageRoute(
            builder: (context) => EnsureScreen(password: passwordController.text,userName:userNameController.text,uId: registerModel!.data!.userId!,)));
      }else{
        showToast(msg: registerModel!.message![0].value!, backgroundColor: AppColors.red);
      }
    }).catchError((error){
      getRegisterCubit.update(data: false);
    });
  }
}