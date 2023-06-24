import 'package:contacts_app_isidore/core/router/navigation_service.dart';
import 'package:contacts_app_isidore/core/router/router.dart';
import 'package:contacts_app_isidore/core/service_locator.dart';
import 'package:flutter/material.dart' hide Router;

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // textTheme: TextThemes.kodchasanTextTheme,
      ),
      navigatorKey: sl<NavigationService>().navigationKey,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
