import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:poffeh_app/cubits/generic_cubit/generic_cubit.dart';
import '../../helper/helper.dart';
import '../../models/register_model.dart';
import '../ensure_password/ensure_screen.dart';

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
      'UserName':nameController.text,
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
            builder: (context) => EnsureScreen(password: passwordController.text,
                userName:userNameController.text)));
      }else{
        Fluttertoast.showToast(
          msg: registerModel!.message![0].value!,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG, // LENGTH_LONG 5s for android
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,  //5s for Ios,Web
          fontSize: 16.0,
        );
      }

    }).catchError((error){
      print(error.toString());
      getRegisterCubit.update(data: false);
    });
  }
}