import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:poffeh_app/components/text/custom_text.dart';
import 'package:poffeh_app/routes/routes.dart';
import 'package:poffeh_app/screen/register/cubit/cubit.dart';
import 'package:poffeh_app/screen/register/cubit/states.dart';
import 'package:poffeh_app/utility/app_theme.dart';
import '../../components/button/button.dart';
import '../../components/text_field/text_field_custom.dart';
import '../../helper/validation.dart';
import '../../utility/all_app_words.dart';
import '../ensure_password/ensure_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = 'RegisterScreen';

  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordAgainController = TextEditingController();
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if(state is RegisterSuccessState){
            if(state.registerModel.state!){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => EnsureScreen(password: passwordController.text,
                      userName: userNameController.text)));
            }else{
              Fluttertoast.showToast(
                msg: state.registerModel.message![0].value!,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_LONG, // LENGTH_LONG 5s for android
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,  //5s for Ios,Web
                fontSize: 16.0,
              );
            }
          }
        },
        builder: (context, state) {
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
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomText(
                            text: LLogin.welcome,
                            color: AppColors.mainColor,
                            fontSize: 20.sp,
                            fontFamily: AppFonts.fontBold),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CustomText(
                            text: LLogin.welcome_desc,
                            color: AppColors.black,
                            fontSize: 14.sp,
                            fontFamily: AppFonts.fontBold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomTextField(
                          controller: userNameController,
                          hintText: LLogin.user_name,
                          labelText: '',
                          inputType: TextInputType.name,
                          textFieldVaidType: TextFieldvalidatorType.DisplayText,
                        ),
                        CustomTextField(
                          controller: nameController,
                          hintText: LLogin.name,
                          labelText: '',
                          inputType: TextInputType.name,
                          textFieldVaidType: TextFieldvalidatorType.DisplayText,
                        ),
                        CustomTextField(
                            controller: emailController,
                            inputType: TextInputType.emailAddress,
                            labelText: '',
                            hintText: LLogin.email,
                            textFieldVaidType: TextFieldvalidatorType.Email),
                        CustomTextField(
                            controller: phoneController,
                            inputType: TextInputType.phone,
                            labelText: '',
                            hintText: LLogin.phone,
                            textFieldVaidType: TextFieldvalidatorType.Number),
                        CustomTextField(
                          controller: passwordController,
                          hintText: LLogin.password,
                          labelText: '',
                          obscureText: true,
                          inputType: TextInputType.text,
                          textFieldVaidType: TextFieldvalidatorType.Password,
                        ),
                        CustomTextField(
                          controller: passwordAgainController,
                          hintText: LLogin.password_again,
                          labelText: '',
                          confirmPasswordController: passwordController,
                          obscureText: true,
                          inputType: TextInputType.text,
                          textFieldVaidType: TextFieldvalidatorType.ConfirmPassword,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        state is! RegisterLoadingState ? CustomButton(
                          fontSize: 14.sp,
                          color: AppColors.mainColor,
                          text: LLogin.register,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              RegisterCubit.get(context).register(
                                  userName: userNameController.text,
                                  phoneNumber: phoneController.text,
                                  email: emailController.text,
                                  name: nameController.text,
                                  role: 'Admin',
                                  password: passwordController.text,
                                  confirmPassword: passwordAgainController.text);
                            }
                          },
                        ) : CircularProgressIndicator(),
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
