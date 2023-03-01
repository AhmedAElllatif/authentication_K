import 'package:flutter/material.dart';
part 'app_colors.dart';
part 'app_fonts.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: AppColors.mainColor,
  appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.white,
      elevation: 0,
      ),
);

class AppStyle {
  static LinearGradient bgLinearGradientGray() {
    return const LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          Color.fromRGBO(90, 91, 92, 1.0),
          Color.fromRGBO(90, 91, 92, 1.0),
        ]);
  }
}
