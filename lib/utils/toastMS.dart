import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMsg {
  static toasMsg(
      {required String msg,
      required Color backgroundColor,
      required Color textColor}) {
    print("this is ToastMsg ==========================================================");
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: 20);
  }
}
