import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

abstract class HelperFunction {
  static bool validateEmail(String email) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(('
        r'\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+'
        r'\.)+[a-zA-Z]{2,}))$').hasMatch(email);
  }
}
