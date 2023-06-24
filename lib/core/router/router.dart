import 'package:contacts_app_isidore/core/router/route_names.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case RouteNames.signIn:
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case RouteNames.signUp:
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const Placeholder());
      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}
