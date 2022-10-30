// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


enum ToastStates { SUCCESS, ERROR, WARNING }
class Constants {
  static void showErrorDialog(
      {required BuildContext context, required String msg}) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          msg,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.black, textStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
              child: const Text('Ok'))
        ],
      ),
    );
  }

  // static void showToast(
  //     {required String msg, Color? color, ToastGravity? gravity}) {
  //   Fluttertoast.showToast(
  //       toastLength: Toast.LENGTH_LONG,
  //       msg: msg,
  //       backgroundColor: color ?? AppColors.primary,
  //       gravity: gravity ?? ToastGravity.BOTTOM);
  // }

  static  void navigateTo(
  context,
  routeName,
) {
  Navigator.pushNamed(context, routeName);
}

static void navigateAndFinish(context, newRouteName) {
  Navigator.pushNamedAndRemoveUntil(context, newRouteName, (route) => false);
}

static void showToast({
  required String message,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);


static Color chooseToastColor(ToastStates state) {
  Color? color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
    default:
  }
  return color!;
}

}
