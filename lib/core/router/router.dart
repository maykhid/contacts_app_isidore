import 'package:contacts_app_isidore/app/feature/home/ui/screen/home.dart';
import 'package:contacts_app_isidore/app/feature/sign_in/data/data_source/repository/sign_in_repository.dart';
import 'package:contacts_app_isidore/app/feature/sign_in/ui/screen/sign_in.dart';
import 'package:contacts_app_isidore/app/feature/sign_up/ui/screen/sign_up.dart';
import 'package:contacts_app_isidore/app/feature/sign_up/ui/screen/verification_sent.dart';
import 'package:contacts_app_isidore/core/router/route_names.dart';
import 'package:contacts_app_isidore/core/service_locator.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) {
            final isUserLoggedIn = sl<SignInRepository>().isUserLoggedIn();

            if (isUserLoggedIn) {
              return const HomeScreen();
            }
            return const SignInScreen();
          },
        );
      case RouteNames.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteNames.verificationSent:
        return MaterialPageRoute(
          builder: (_) => const VerificationSentScreen(),
        );
      default:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
    }
  }
}
