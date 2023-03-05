import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poffeh_app/components/button/button.dart';
import 'package:poffeh_app/components/text/custom_text.dart';
import 'package:poffeh_app/cubits/generic_cubit/generic_cubit.dart';
import 'package:poffeh_app/utility/all_app_words.dart';
import 'package:poffeh_app/utility/app_theme.dart';
import '../../../routes/routes.dart';
import 'ensure_view_model.dart';

class EnsurePasswordScreen extends StatelessWidget {
  final String id;
  final String userName;
  EnsurePasswordScreen({super.key, required this.id, required this.userName});

  EnsureViewModel ensureViewModel = EnsureViewModel();

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
            padding:  EdgeInsets.all(8.sp),
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
            padding:  EdgeInsets.all(26.sp),
            child: Form(
              key: ensureViewModel.formKey,
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
                    padding:
                     EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal: 5.w),
                            child: TextFormField(
                              maxLength: 1,
                              controller: ensureViewModel.field1,
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
                            padding:  EdgeInsets.symmetric(
                                horizontal: 5.w),
                            child: TextFormField(
                              maxLength: 1,
                              controller: ensureViewModel.field2,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return LLogin.empty;
                                }
                                return null;
                              },
                              decoration:const InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal: 5.w),
                            child: TextFormField(
                              maxLength: 1,
                              controller: ensureViewModel.field3,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return LLogin.empty;
                                }
                                return null;
                              },
                              decoration:const InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal: 5.w),
                            child: TextFormField(
                              maxLength: 1,
                              controller: ensureViewModel.field4,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return LLogin.empty;
                                }
                                return null;
                              },
                              decoration:const InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal: 5.w),
                            child: TextFormField(
                              maxLength: 1,
                              controller: ensureViewModel.field5,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return LLogin.empty;
                                }
                                return null;
                              },
                              decoration:const InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal: 5.w),
                            child: TextFormField(
                              maxLength: 1,
                              controller: ensureViewModel.field6,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return LLogin.empty;
                                }
                                return null;
                              },
                              decoration:const InputDecoration(
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
                    bloc: ensureViewModel.getEnsure,
                    listener: (context, state) {},
                    builder: (context, state) {
                      return state.data! ?const CircularProgressIndicator() : CustomButton(
                        text: LLogin.ensure,
                        onPressed: () {
                          if (ensureViewModel.formKey.currentState!.validate()) {
                            ensureViewModel.ensurePassword(
                              userId: id,
                              username: userName,);
                          }
                        },
                        color: AppColors.mainColor,
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
