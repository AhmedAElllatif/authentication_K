//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:poffeh_app/helper/helper.dart';
//import 'package:poffeh_app/models/login_model.dart';
//import 'package:poffeh_app/screen/login/cubit/states.dart';
//
//class LoginCubit extends Cubit<LoginStates>{
//  LoginCubit():super(LoginInitialState());
//  static LoginCubit get(context) => BlocProvider.of(context);
//  LoginModel? loginModel;
//  void login({
//  required String userName,
//  required String password,
//  required String rememberMe,
//}){
//    emit(LoginLoadingState());
//    Helper.postData(
//        url: 'Account/Login',
//        data: {
//      'UserName':userName,
//      'Password' : password,
//      'RememberMe': rememberMe,
//      'deviceId': "2dc86094-5131-49cc-9276-2284a32555f9",
//    }).then((value) {
//      loginModel = LoginModel.fromJson(value.data);
//      emit(LoginSuccessState(loginModel!));
//    }).catchError((error){
//      print(error.toString());
//      emit(LoginErrorState(error.toString()));
//    });
//  }
//}