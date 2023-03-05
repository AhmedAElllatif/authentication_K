//import 'dart:async';
//
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:poffeh_app/screen/ensuree/cubit/states.dart';
//
//import '../../../helper/helper.dart';
//import '../../../models/ensure_model.dart';
//import '../../../models/login_model.dart';
//
//
//
//class EnsureCubit extends Cubit<EnsureStates>{
//  EnsureCubit():super(EnsureInitialState());
//  static EnsureCubit get(context) => BlocProvider.of(context);
//
//  EnsureModel? ensureModel;
//  void ensure({
//    required String code,
//    required String password,
//    required String username,
//  }){
//    emit(EnsureLoadingState());
//    Helper.postData(url: 'Account/VerifyCode', data: {
//      'Username': username,
//      'Password': password,
//      'Code': code,
//    }).then((value){
//      ensureModel = EnsureModel.fromJson(value.data);
//      emit(EnsureSuccessState(ensureModel!));
//    }).catchError((error){
//      print(error.toString());
//      emit(EnsureErorrState(error.toString()));
//    });
//  }
//
//}