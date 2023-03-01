import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routes/routes.dart';
import '../../utility/app_theme.dart';
import '../text/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final double height;
  final Function? onPressed;
  final double fontSize;
  final Color color;
  final Color colorFont;
  final bool isButtonBorder ;
  final Color? borderColor ;

  const CustomButton({
    Key? key,
    this.height = 40.0,
    this.onPressed,
    this.fontSize = 14,
    this.text,
    this.colorFont = Colors.white,
    this.isButtonBorder = false,
    this.color = Colors.white,
    this.borderColor ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: color ,
          border: isButtonBorder
              ? Border.all(color: borderColor == null
              ? AppColors.secondaryColor
              : borderColor!, width: 1)
              :  null
      ),

      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30.r),
          onTap: () {
            onPressed == null ? goBack() : onPressed!();
          },
          child: Center(
            child: CustomText(
              bold: false,
              text: text!,
              fontSize: fontSize,
              fontFamily: AppFonts.fontKUFIB,
              color: colorFont,
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
