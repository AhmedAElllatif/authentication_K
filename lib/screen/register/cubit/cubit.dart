//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:get/get.dart';
//import 'package:poffeh_app/helper/helper.dart';
//import 'package:poffeh_app/models/register_model.dart';
//import 'package:poffeh_app/screen/register/cubit/states.dart';
//
//import '../../ensure_password/ensure_screen.dart';
//
//class RegisterCubit extends Cubit<RegisterStates>{
//  RegisterCubit() : super(RegisterInitialState());
//  static RegisterCubit get(context) => BlocProvider.of(context);
//
//  TextEditingController nameController = TextEditingController();
//  TextEditingController passwordController = TextEditingController();
//  TextEditingController passwordAgainController = TextEditingController();
//  TextEditingController userNameController = TextEditingController();
//  TextEditingController emailController = TextEditingController();
//  TextEditingController phoneController = TextEditingController();
//  GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//  RegisterModel? registerModel;
//  void register(){
//    emit(RegisterLoadingState());
//    Helper.postData(url: 'Account/Register', data: {
//      'UserName':nameController.text,
//      'PhoneNumber':phoneController.text,
//      'Email':emailController.text,
//      'Name':nameController.text,
//      'Role':'Admin',
//      'Password':passwordController.text,
//      'ConfirmPassword':passwordAgainController.text,
//    }).then((value) {
//      registerModel = RegisterModel.fromJson(value.data);
//      if(registerModel!.state!){
////        Navigator.push(Get.context!, MaterialPageRoute(
////            builder: (context) => EnsureScreen(password: passwordController.text,
////                userName:userNameController.text)));
//      }else{
//        Fluttertoast.showToast(
//          msg: registerModel!.message![0].value!,
//          backgroundColor: Colors.red,
//          textColor: Colors.white,
//          toastLength: Toast.LENGTH_LONG, // LENGTH_LONG 5s for android
//          gravity: ToastGravity.BOTTOM,
//          timeInSecForIosWeb: 5,  //5s for Ios,Web
//          fontSize: 16.0,
//        );
//      }
//      emit(RegisterSuccessState(registerModel!));
//    }).catchError((error){
//      print(error.toString());
//      emit(RegisterErrorState(error.toString()));
//    });
//  }
//}