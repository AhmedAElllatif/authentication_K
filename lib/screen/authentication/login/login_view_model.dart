import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poffeh_app/components/my_toast/my_toast.dart';
import 'package:poffeh_app/cubits/generic_cubit/generic_cubit.dart';
import 'package:poffeh_app/screen/authentication/ensuree/ensure_screen.dart';
import 'package:poffeh_app/utility/app_theme.dart';
import 'package:poffeh_app/utility/local_storge_key.dart';
import '../../../helper/cache_helper.dart';
import '../../../helper/helper.dart';
import '../../../models/login_model.dart';
import '../../../routes/routes.dart';


class LoginViewModel{  //finish
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  GenericCubit<bool> getLogin = GenericCubit(data: false);

  LoginModel? loginModel;
  void login({
    required String rememberMe,
  }){
    getLogin.update(data: true);
    Helper.postData(
        url: 'Account/Login',
        data: {
          'UserName':nameController.text,
          'Password' : passwordController.text,
          'RememberMe': rememberMe,
          'deviceId': "2dc86094-5131-49cc-9276-2284a32555f9",
        }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      getLogin.update(data: false);
      if (loginModel!.state!) {
        if( loginModel!.data!.user!.emailConfirmed!){
          CacheHelper.saveData(
              key: 'token',
              value: loginModel!.data!.token!.accessToken!).then((value) {
            token = loginModel!.data!.token!.accessToken!;
            goToScreenpopAndPushNamed(screenNames: ScreenNames.homeScreen);
          });
        }else{
          Navigator.push(Get.context!, MaterialPageRoute(
              builder: (context) => EnsureScreen(
                password: loginModel!.data!.loginData!.password!,
                userName:loginModel!.data!.loginData!.userName!,
                uId: loginModel!.data!.user!.id!,)
          )); }
      } else {
        showToast(msg: loginModel!.message![0].value!, backgroundColor: AppColors.red);
      }
    }).catchError((error){
      getLogin.update(data: false);
    });
  }

}