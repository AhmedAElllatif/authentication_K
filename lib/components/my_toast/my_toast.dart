import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String msg,
  required Color backgroundColor,
}) => Fluttertoast.showToast(
  msg: msg,
  backgroundColor: backgroundColor,
  textColor: Colors.white,
  toastLength: Toast.LENGTH_LONG, // LENGTH_LONG 5s for android
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 5,  //5s for Ios,Web
  fontSize: 16.0,
);
