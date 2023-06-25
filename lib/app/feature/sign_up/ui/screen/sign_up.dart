import 'package:contacts_app_isidore/core/extensions/sized_context.dart';
import 'package:contacts_app_isidore/core/router/navigation_service.dart';
import 'package:contacts_app_isidore/core/router/route_names.dart';
import 'package:contacts_app_isidore/core/service_locator.dart';
import 'package:contacts_app_isidore/core/ui/ui.dart';
import 'package:contacts_app_isidore/core/ui/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // app title
                  Align(
                    child: Text(
                      'MyContactsApp',
                      style: AppTextStyles.normalTextPrimary,
                    ),
                  ),

                  const SizedBox(
                    height: 70,
                  ),

                  // sign in
                  Text(
                    'Sign Up',
                    style: AppTextStyles.extraLargeTextPrimary,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Create your mycontactapp account',
                    style: AppTextStyles.smallTextGrey,
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  // email and field
                  Text(
                    'Email',
                    style: AppTextStyles.normalTextPrimary,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  AppTextField(
                    hintText: 'example@email.com',
                    controller: TextEditingController(),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // password field
                  Text(
                    'Password',
                    style: AppTextStyles.normalTextPrimary,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppTextField(
                    hintText: '*******',
                    controller: TextEditingController(),
                    suffixIcon: Icon(
                      Icons.remove_red_eye_rounded,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  Text(
                    'Confirm Password',
                    style: AppTextStyles.normalTextPrimary,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  AppTextField(
                    hintText: '*******',
                    controller: TextEditingController(),
                    suffixIcon: Icon(
                      Icons.remove_red_eye_rounded,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // login btn
                  AppButton(
                    width: context.width,
                    onPressed: () => sl<NavigationService>().navigateTo(
                      RouteNames.verificationSent,
                    ),
                    child: Text(
                      'Create Account',
                      style: AppTextStyles.normalTextWhite,
                    ),
                  ),

                  const SizedBox(
                    height: 45,
                  ),

                  // don't have acc
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account?',
                        style: AppTextStyles.smallTextGrey,
                        children: [
                          TextSpan(
                            text: ' Sign In',
                            style: AppTextStyles.normalTextPrimary2,
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => sl<NavigationService>().navigateTo(
                                        RouteNames.signIn,
                                      ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
