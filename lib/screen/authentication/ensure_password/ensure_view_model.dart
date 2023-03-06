import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poffeh_app/components/my_toast/my_toast.dart';
import 'package:poffeh_app/cubits/generic_cubit/generic_cubit.dart';
import 'package:poffeh_app/screen/authentication/reset_password/reset_password_screen.dart';
import 'package:poffeh_app/utility/app_theme.dart';
import '../../../helper/helper.dart';
import '../../../models/Ensure_password_model.dart';
import '../../../routes/routes.dart';


class EnsureViewModel{

TextEditingController field1 = TextEditingController();
TextEditingController field2 = TextEditingController();
TextEditingController field3 = TextEditingController();
TextEditingController field4 = TextEditingController();
TextEditingController field5 = TextEditingController();
TextEditingController field6 = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();
GenericCubit<bool> getEnsure = GenericCubit(data: false);

EnsurePasswordModel? ensurePasswordModel;
void ensurePassword({
  required String username,
  required String userId,
}){
  getEnsure.update(data: true);
  Helper.postData(url: 'Account/ForgotPasswordConfirmation', data: {
    'Username': username,
    'Code': '${field6.text}${field5.text}${field4.text}${field3.text}${field2.text}${field1.text}',
    'UserId': userId,
  }).then((value){
    ensurePasswordModel = EnsurePasswordModel.fromJson(value.data);
    getEnsure.update(data: false);
    if (ensurePasswordModel!.state!) {
      Navigator.pushReplacement(Get.context!, MaterialPageRoute(builder: (context) => ResetPasswordScreen(username))) ;
//      Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => ResetPasswordScreen(username)));
    } else {
      showToast(msg: ensurePasswordModel!.message![0].value!, backgroundColor: AppColors.red);
    }
  }).catchError((error){
    getEnsure.update(data: false);
  });
}

}