import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:poffeh_app/helper/helper.dart';
import 'package:poffeh_app/models/register_model.dart';
import 'package:poffeh_app/screen/register/cubit/states.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  
  RegisterModel? registerModel;
  void register({
  required String userName,
  required String phoneNumber,
  required String email,
  required String name,
  required String role,
  required String password,
  required String confirmPassword,
}){
    emit(RegisterLoadingState());
    Helper.postData(url: 'Account/Register', data: {
      'UserName':userName,
      'PhoneNumber':phoneNumber,
      'Email':email,
      'Name':name,
      'Role':role,
      'Password':password,
      'ConfirmPassword':confirmPassword,
    }).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      emit(RegisterSuccessState(registerModel!));
    }).catchError((error){
      print(error.toString());
      Fluttertoast.showToast(
        msg: error,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG, // LENGTH_LONG 5s for android
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,  //5s for Ios,Web
        fontSize: 16.0,
      );
      emit(RegisterErrorState(error.toString()));
    });
  }
}