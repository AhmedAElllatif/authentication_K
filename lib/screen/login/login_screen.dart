import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:poffeh_app/components/text/custom_text.dart';
import 'package:poffeh_app/helper/cache_helper.dart';
import 'package:poffeh_app/routes/routes.dart';
import 'package:poffeh_app/screen/login/cubit/cubit.dart';
import 'package:poffeh_app/screen/login/cubit/states.dart';
import 'package:poffeh_app/utility/app_theme.dart';
import '../../components/button/button.dart';
import '../../components/text_field/text_field_custom.dart';
import '../../helper/validation.dart';
import '../../utility/all_app_words.dart';

class LoginScreen extends StatelessWidget {
  static const routeName ='LoginScreen';
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: BlocConsumer<LoginCubit, LoginStates>(
  listener: (context, state) {
    if(state is LoginSuccessState){
      if(state.loginModel.state!){
        CacheHelper.saveData(key: 'token', value: state.loginModel.data!.token!.accessToken!).then((value) {
          goToScreen(screenNames: ScreenNames.homeScreen);
        });
      }else{
        Fluttertoast.showToast(
          msg: state.loginModel.message![0].value!,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG, // LENGTH_LONG 5s for android
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,  //5s for Ios,Web
          fontSize: 16.0,
        );
        print(state.loginModel.message![0].value!);
      }
    }
 },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(image: AssetImage(AppImage.logo),
            width: 49.w,
            height: 34.h,
            fit: BoxFit.fill,
          ),
        ),
        actions: [
          IconButton(onPressed: (){
          goBack();
          },
              icon: Icon(Icons.arrow_forward_ios,color: Colors.black,))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomText(text: LLogin.welcome, color: AppColors.mainColor, fontSize: 20.sp, fontFamily: AppFonts.fontBold),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomText(text: LLogin.welcome_desc, color: AppColors.black, fontSize: 14.sp, fontFamily: AppFonts.fontBold,textAlign: TextAlign.center,),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextField(
                    controller: nameController,
                    hintText: LLogin.user_name,
                    labelText: '',
                    inputType: TextInputType.name,
                    textFieldVaidType: TextFieldvalidatorType.DisplayText,
                  ),

                  CustomTextField(
                    controller: passwordController,
                    hintText: LLogin.password,
                    labelText: '',
                    obscureText: true,
                    inputType: TextInputType.text,
                    textFieldVaidType: TextFieldvalidatorType.Password,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  state is! LoginLoadingState ?  CustomButton(
                    fontSize: 14.sp,
                    color: AppColors.mainColor,
                    text:LLogin.login,
                    onPressed: (){
                    if(formKey.currentState!.validate()){
                      LoginCubit.get(context).login(userName: nameController.text, password: passwordController.text, rememberMe: 'true');
//                      goToScreen(screenNames: ScreenNames.defaultscreen);
                    }
                  },) : CircularProgressIndicator(),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: (){
                      goToScreen(screenNames: ScreenNames.forgetPasswordScreen);
                    },
                    child: CustomText(text: LLogin.forget_password, color: AppColors.Kbluecolor, fontSize: 14.sp,
                        fontFamily: AppFonts.fontMedium),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: LLogin.haveAccount, color: AppColors.black, fontSize: 14.sp,
                            fontFamily: AppFonts.fontMedium),
                        SizedBox(width: 5.w,),
                        InkWell(
                          onTap: (){
                            goToScreen(screenNames: ScreenNames.registerScreen);
                          },
                          child: CustomText(text: LLogin.register, color: AppColors.mainColor, fontSize: 14.sp,
                              fontFamily: AppFonts.fontMedium),
                        ),
                      ],
                    ),
                  )


                ],
              ),
            ),
          ),
        ),
      ),
    );
  },
),
);
  }
}
