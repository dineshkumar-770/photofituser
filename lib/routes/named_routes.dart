import 'package:flutter/material.dart';
import 'package:photo_fit_user/features/Home/screens/home_page.dart';
import 'package:photo_fit_user/features/authentication/screens/login_screen.dart';
import 'package:photo_fit_user/features/authentication/screens/register_screen.dart';
import 'package:photo_fit_user/features/navigation_bar/screen/navbar.dart';
import 'package:photo_fit_user/features/user_details/screens/userdetails_screen.dart';

abstract class RoutesName {
  static const registerScreen = "/registerScreen";
  static const loginscreen = "/loginscreen";
  static const homeScreen = "/homeScreen";
  static const rootScreen = "/rootScreen";
  static const userDetailsScreen = "/userDetailsScreen";
}

class GeneratedRoutes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final route = settings.name;

    if (route == RoutesName.registerScreen) {
      return MaterialPageRoute(
        builder: (context) => const RegistrationScreen(),
      );
    }
    if (route == RoutesName.loginscreen) {
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    }
    if(route == RoutesName.rootScreen){
      return MaterialPageRoute(
        builder: (context) => const RootScreen(),
      );
    }
    if (route == RoutesName.homeScreen) {
      return MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
    }
    if (route == RoutesName.userDetailsScreen) {
      return MaterialPageRoute(
        builder: (context) => const UserDetailsScreen(),
      );
    }
    return MaterialPageRoute(
      builder: (context) => const RootScreen(),
    );
  }
}
