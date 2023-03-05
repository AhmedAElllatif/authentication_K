import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poffeh_app/helper/helper.dart';
import 'package:poffeh_app/models/forget_password_model.dart';
import 'package:poffeh_app/screen/forger_password/cubit/states.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates>{
  ForgetPasswordCubit():super(ForgetPasswordInitialState());
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  ForgetPasswordModel? forgetPasswordModel;
  void forget(String username){
    emit(ForgetPasswordLoadingState());
    Helper.postData(url: 'Account/ForgotPassword', data: {
      'Username' : username,
    }).then((value) {
      forgetPasswordModel = ForgetPasswordModel.fromJson(value.data);
      emit(ForgetPasswordSuccessState(forgetPasswordModel!));
    }).catchError((error){
      print(error.toString());
      emit(ForgetPasswordErrorState(error.toString()));
    });
  }
}
