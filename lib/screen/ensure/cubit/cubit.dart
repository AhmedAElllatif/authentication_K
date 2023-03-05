import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poffeh_app/screen/ensure/cubit/states.dart';

import '../../../helper/helper.dart';
import '../../../models/Ensure_password_model.dart';
import '../../../models/ensure_model.dart';
import '../../../models/login_model.dart';



class EnsurePasswordCubit extends Cubit<EnsurePasswordStates>{
  EnsurePasswordCubit():super(EnsurePasswordInitialState());
  static EnsurePasswordCubit get(context) => BlocProvider.of(context);

  EnsurePasswordModel? ensurePasswordModel;
  void ensurePassword({
  required String code,
  required String username,
  required String userId,
}){
    emit(EnsurePasswordLoadingState());
    Helper.postData(url: 'Account/ForgotPasswordConfirmation', data: {
      'Username': username,
      'Code': code,
      'UserId': userId,
    }).then((value){
      ensurePasswordModel = EnsurePasswordModel.fromJson(value.data);
      emit(EnsurePasswordSuccessState(ensurePasswordModel!));
    }).catchError((error){
      print(error.toString());
      emit(EnsurePasswordErorrState(error.toString()));
    });
  }

}