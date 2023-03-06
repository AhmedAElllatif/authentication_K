import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poffeh_app/components/button/button.dart';
import 'package:poffeh_app/components/text/custom_text.dart';
import 'package:poffeh_app/cubits/generic_cubit/generic_cubit.dart';
import 'package:poffeh_app/utility/all_app_words.dart';
import 'package:poffeh_app/utility/app_theme.dart';

import '../../../routes/routes.dart';
import 'ensuree_view_model.dart';

class EnsureScreen extends StatelessWidget {
  final String password;
  final String userName;
  final String uId;
  EnsureScreen({super.key, required this.password, required this.userName, required this.uId});
  EnsureeViewModel ensureeViewModel = EnsureeViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              goBack();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: Image(
              image: const AssetImage(AppImage.logo),
              width: 49.w,
              height: 34.h,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(26.sp),
            child: Form(
              key: ensureeViewModel.formKey,
              child: Column(
                children: [
                  CustomText(
                      text: LLogin.activation,
                      color: AppColors.mainColor,
                      fontSize: 18.sp,
                      fontFamily: AppFonts.fontBold),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: TextFormField(
                              maxLength: 1,
                              controller: ensureeViewModel.field1,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return LLogin.empty;
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: TextFormField(
                              maxLength: 1,
                              controller: ensureeViewModel.field2,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return LLogin.empty;
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: TextFormField(
                              maxLength: 1,
                              controller: ensureeViewModel.field3,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return LLogin.empty;
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: TextFormField(
                              maxLength: 1,
                              controller: ensureeViewModel.field4,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return LLogin.empty;
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: TextFormField(
                              maxLength: 1,
                              controller: ensureeViewModel.field5,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return LLogin.empty;
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
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
                              controller: ensureeViewModel.field6,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return LLogin.empty;
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
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
                  BlocConsumer<GenericCubit<bool>, GenericState<bool>>(
                    bloc: ensureeViewModel.getEnsuree,
                    listener: (context, state) {},
                    builder: (context, state) {
                      return state.data!
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              text: LLogin.ensure,
                              onPressed: () {
                                if (ensureeViewModel.formKey.currentState!
                                    .validate()) {
                                  ensureeViewModel.ensure(
                                    password: password,
                                    username: userName,
                                  );
                                }
                              },
                              color: AppColors.mainColor,
                            );
                    },
                  ),
                  SizedBox(height: 15.h,),
                  BlocConsumer<GenericCubit<bool>, GenericState<bool>>(
                    bloc: ensureeViewModel.getResend,
                    listener: (context, state) {},
                    builder: (context, state) {
                      return state.data! ? const CircularProgressIndicator() : InkWell(
                        onTap: () {
                          ensureeViewModel.regenerateCode(username: userName, userId: uId);
                        },
                        child: CustomText(
                            text: LLogin.resend,
                            color: AppColors.Kbluecolor,
                            fontSize: 14.sp,
                            fontFamily: AppFonts.fontMedium),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
