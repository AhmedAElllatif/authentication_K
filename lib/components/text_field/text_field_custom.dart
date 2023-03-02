import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../helper/validation.dart';
import '../../utility/app_theme.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final TextInputType inputType;
  final String labelText;
  final String hintText;
  final TextFieldvalidatorType? textFieldVaidType;
  final TextEditingController controller;
  TextEditingController? confirmPasswordController;
  final String? firstPasswordToConfirm;
  double containtPaddingRight;
  Widget? icon;
  bool obscureText;
  int? maxLength;
  int? maxLines;
  bool isDisable = false;
  double? iconDataHeight ;
  double? iconDataWidth ;
  final String? iconData;


  CustomTextField(
      {required this.controller,
        required this.inputType,
        this.obscureText = false,
        this.confirmPasswordController,
        required this.labelText,
        required this.hintText,
        required this.textFieldVaidType,
        this.containtPaddingRight = 20,
        this.icon,
        this.maxLength,
        this.maxLines,
        this.iconDataHeight,
        this.iconDataWidth,
        this.isDisable = false,
        this.firstPasswordToConfirm ,
        this.iconData,

      });

  @override
  _CustomTextFieldState createState() =>
      _CustomTextFieldState();
}
class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        hintColor: Color(0xfff9b320).withOpacity(.9),
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: AppColors.mainColor,
        controller: widget.controller,
        autofocus: false,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines ?? 1,
        keyboardType: widget.inputType,
        obscureText: widget.obscureText,
        obscuringCharacter: '*',
        readOnly: widget.isDisable,
        validator: (v) => validation(
            type: widget.textFieldVaidType!,
            value: v!,
            firstPAsswordForConfirm: widget.textFieldVaidType ==
                TextFieldvalidatorType.ConfirmPassword
                ? widget.confirmPasswordController!.value.text
                : ""),
        decoration: InputDecoration(
          counter: Offstage(),
          prefixIcon: widget.iconData != null
              ? Padding(
            padding: EdgeInsets.all(13.sp),
            child: SvgPicture.asset(
              widget.iconData!,
              height: widget.iconDataHeight != null ? widget.iconDataHeight : 10.h,
              width: widget.iconDataWidth !=null ? widget.iconDataWidth : 10.w,
            ),
          ) : null,

          errorStyle: TextStyle(
              height: 1.4,
              fontFamily: AppFonts.fontLight,
              fontSize: 12.sp,
              color: AppColors.red),

          fillColor: widget.isDisable ? AppColors.black.withOpacity(.1) :AppColors.fillColor.withOpacity(.4),
          filled: true,

          contentPadding:
          EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
          alignLabelWithHint: true,

          suffixIcon: widget.textFieldVaidType == TextFieldvalidatorType.Password ||
              widget.textFieldVaidType ==
                  TextFieldvalidatorType.ConfirmPassword
              ? GestureDetector(
            onTap: () {
              setState(() {
                widget.obscureText = !widget.obscureText;
              });
            },
            child: widget.obscureText ? Icon(Icons.visibility_off,
                color: AppColors.black.withOpacity(.5), size: 20) : Icon(Icons.visibility,
                color: AppColors.black.withOpacity(.5), size: 20),
          )
              : SizedBox(
            height: 0,
            width: 0,
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: AppColors.black.withOpacity(.4),
            fontFamily: AppFonts.fontBold,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular( widget.maxLines == null ? 30.r : 15.r),
            borderSide: BorderSide.none,
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular( widget.maxLines == null ? 30.r : 15.r),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(
          fontSize: 16.sp,
          color: AppColors.black,
          fontFamily:
          TextFieldvalidatorType.Password  == TextFieldvalidatorType.Password ||
              TextFieldvalidatorType.ConfirmPassword  == TextFieldvalidatorType.ConfirmPassword
              ? AppFonts.fontLight : AppFonts.fontBold,
        ),
      ),
    );
  }
}
