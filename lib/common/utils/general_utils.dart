import 'package:another_flushbar/another_flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GeneralUtils {
  static toastmessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.purple,
      textColor: Colors.white,
      fontSize: 16.0,
      gravity: ToastGravity.TOP,
    );
  }

  static flushbarmessage(BuildContext context, String message) {
    Flushbar(
      title: "Notification",
      titleColor: Colors.black,
      message: message,
      messageColor: Colors.purple,
      duration: Duration(seconds: 2),
      backgroundColor: Colors.white,
      animationDuration: Duration(seconds: 2),
      reverseAnimationCurve: Curves.linear,
      margin: EdgeInsets.symmetric(horizontal: 40),
      flushbarPosition: FlushbarPosition.TOP,
      safeArea: true,
      icon: Icon(Icons.circle_notifications_rounded),
      borderRadius: BorderRadius.circular(30),
    ).show(context);
  }

  static void fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
