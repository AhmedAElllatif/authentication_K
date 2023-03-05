import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:poffeh_app/components/button/button.dart';
import 'package:poffeh_app/components/text/custom_text.dart';
import 'package:poffeh_app/screen/ensure/cubit/cubit.dart';
import 'package:poffeh_app/utility/all_app_words.dart';
import 'package:poffeh_app/utility/app_theme.dart';
import '../../helper/cache_helper.dart';
import '../../routes/routes.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class EnsureScreen extends StatelessWidget {
  final String password;
  final String userName;
  EnsureScreen({required this.password, required this.userName});

  var field1 = TextEditingController();
  var field2 = TextEditingController();
  var field3 = TextEditingController();
  var field4 = TextEditingController();
  var field5 = TextEditingController();
  var field6 = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => EnsureCubit(),
      child:
          BlocConsumer<EnsureCubit, EnsureStates>(listener: (context, state) {
        if (state is EnsureSuccessState) {
          if (state.ensureModel.state!) {
            CacheHelper.saveData(
                    key: 'token',
                    value: state.ensureModel.data!.token!.accessToken!)
                .then((value) {
              goToScreen(screenNames: ScreenNames.homeScreen);
            });
          } else {
            Fluttertoast.showToast(
              msg: state.ensureModel.message![0].value!,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              toastLength: Toast.LENGTH_LONG, // LENGTH_LONG 5s for android
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5, //5s for Ios,Web
              fontSize: 16.0,
            );
          }
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(AppImage.logo),
                width: 49.w,
                height: 34.h,
                fit: BoxFit.fill,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    goBack();
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ))
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [

                      CustomText(
                          text: LLogin.activation,
                          color: AppColors.mainColor,
                          fontSize: 18.sp,
                          fontFamily: AppFonts.fontBold),
                      SizedBox(
                        height: 23.h,
                      ),
                      CustomText(
                          textAlign: TextAlign.center,
                          text: 'Enter activation code that we sent by Email',
                          color: AppColors.black,
                          fontSize: 15.sp,
                          fontFamily: AppFonts.fontMedium),
                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: TextFormField(
                                  maxLength: 1,
                                  controller: field1,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Add Your Data';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    counterText: '',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: TextFormField(
                                  maxLength: 1,
                                  controller: field2,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Add Your Data';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    counterText: '',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: TextFormField(
                                  maxLength: 1,
                                  controller: field3,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Add Your Data';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    counterText: '',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: TextFormField(
                                  maxLength: 1,
                                  controller: field4,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Add Your Data';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    counterText: '',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: TextFormField(
                                  maxLength: 1,
                                  controller: field5,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Add Your Data';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    counterText: '',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: TextFormField(
                                  maxLength: 1,
                                  controller: field6,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Add Your Data';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    counterText: '',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      state is! EnsureLoadingState
                          ? CustomButton(
                              text: LLogin.ensure,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  EnsureCubit.get(context).ensure(
                                      password: password,
                                      username: userName,
                                      code: '${field1.text}${field2.text}${field3.text}${field4.text}${field5.text}${field6.text}');
                                }
                              },
                              color: AppColors.mainColor,
                            )
                          : CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
