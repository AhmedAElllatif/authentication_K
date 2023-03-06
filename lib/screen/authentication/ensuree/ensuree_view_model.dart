import 'package:flutter/material.dart';
import 'package:poffeh_app/components/my_toast/my_toast.dart';
import 'package:poffeh_app/utility/app_theme.dart';
import 'package:poffeh_app/utility/local_storge_key.dart';

import '../../../cubits/generic_cubit/generic_cubit.dart';
import '../../../helper/cache_helper.dart';
import '../../../helper/helper.dart';
import '../../../models/ensure_model.dart';
import '../../../models/regenerate_code_model.dart';
import '../../../routes/routes.dart';


class EnsureeViewModel{
  TextEditingController field1 = TextEditingController();
  TextEditingController field2 = TextEditingController();
  TextEditingController field3 = TextEditingController();
  TextEditingController field4 = TextEditingController();
  TextEditingController field5 = TextEditingController();
  TextEditingController field6 = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  GenericCubit<bool> getEnsuree = GenericCubit(data: false);


  EnsureModel? ensureModel;
  void ensure({
    required String password,
    required String username,
  }){
    getEnsuree.update(data: true);
    Helper.postData(url: 'Account/VerifyCode', data: {
      'Username': username,
      'Password': password,
      'Code': '${field6.text}${field5.text}${field4.text}${field3.text}${field2.text}${field1.text}',
    }).then((value){
      ensureModel = EnsureModel.fromJson(value.data);
      getEnsuree.update(data: false);
      if (ensureModel!.state!) {
        CacheHelper.saveData(
            key: 'token',
            value: ensureModel!.data!.token!.accessToken!)
            .then((value) {
              token = ensureModel!.data!.token!.accessToken!;
          goToScreenpopAndPushNamed(screenNames: ScreenNames.homeScreen);
        });
      } else {
        showToast(msg: ensureModel!.message![0].value!, backgroundColor: AppColors.red);
      }
    }).catchError((error){
      getEnsuree.update(data: false);
    });
  }


  GenericCubit<bool> getResend = GenericCubit(data: false);

  RegenerateCodeModel? regenerateCodeModel;
  void regenerateCode({
  required String username,
  required String userId,
}){
    getResend.update(data: true);
    Helper.postData(url: 'Account/ReGenrateCode', data: {
      'Username' : username,
      'UserId' : userId,
    }).then((value){
      regenerateCodeModel = RegenerateCodeModel.fromJson(value.data);
      getResend.update(data: false);
      if(regenerateCodeModel!.state!){
        showToast(msg: regenerateCodeModel!.message![0].value!, backgroundColor: AppColors.green);
      }else{
        showToast(msg: regenerateCodeModel!.message![0].value!, backgroundColor: AppColors.red);
      }
    }).catchError((error){
      print(error.toString());
      getResend.update(data: false);
    });
  }


}