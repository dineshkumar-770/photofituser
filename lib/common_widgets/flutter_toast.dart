import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast{
  static void showToast(String message){
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}