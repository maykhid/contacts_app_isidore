import 'package:contacts_app_isidore/app/app.dart';
import 'package:contacts_app_isidore/core/service_locator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await setupLocator();
  runApp(const ContactsApp());
}
