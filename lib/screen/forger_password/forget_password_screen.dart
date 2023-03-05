import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:poffeh_app/components/text/custom_text.dart';
import 'package:poffeh_app/routes/routes.dart';
import 'package:poffeh_app/screen/ensure/ensure_password_screen.dart';
import 'package:poffeh_app/screen/forger_password/cubit/states.dart';
import 'package:poffeh_app/utility/app_theme.dart';
import '../../components/button/button.dart';
import '../../components/text_field/text_field_custom.dart';
import '../../helper/validation.dart';
import '../../utility/all_app_words.dart';
import 'cubit/cubit.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const routeName ='ForgetPasswordScreen';
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
        listener: (context, state) {
          if(state is ForgetPasswordSuccessState){
            if(state.forgetPasswordModel.state!){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => EnsurePasswordScreen(id: state.forgetPasswordModel.data!.applicationUser!.id!,
                      userName: state.forgetPasswordModel.data!.applicationUser!.userName!)));
            }else{
              Fluttertoast.showToast(
                msg: state.forgetPasswordModel.message![0].value!,
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
                        CustomText(text: LLogin.password_aagain, color: AppColors.mainColor, fontSize: 20.sp, fontFamily: AppFonts.fontBold),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CustomText(text: LLogin.password_again_desc, color: AppColors.black, fontSize: 14.sp, fontFamily: AppFonts.fontBold,textAlign: TextAlign.center,),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        CustomTextField(
                          controller: nameController,
                          hintText: LLogin.user_name,
                          labelText: '',
                          inputType: TextInputType.name,
                          textFieldVaidType: TextFieldvalidatorType.DisplayText,
                        ),

                        SizedBox(
                          height: 20.h,
                        ),
                        state is! ForgetPasswordLoadingState ?  CustomButton(
                          fontSize: 14.sp,
                          color: AppColors.mainColor,
                          text:LLogin.next,
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              ForgetPasswordCubit.get(context).forget(nameController.text);
                            }
                          },) : CircularProgressIndicator(),

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
