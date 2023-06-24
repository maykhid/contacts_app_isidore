import 'package:contacts_app_isidore/app/feature/home/ui/screen/home.dart';
import 'package:contacts_app_isidore/app/feature/sign_in/ui/screen/sign_in.dart';
import 'package:contacts_app_isidore/app/feature/sign_up/ui/screen/sign_up.dart';
import 'package:contacts_app_isidore/core/router/route_names.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case RouteNames.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
    }
  }
}
