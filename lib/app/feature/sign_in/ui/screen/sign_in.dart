import 'package:contacts_app_isidore/core/extensions/sized_context.dart';
import 'package:contacts_app_isidore/core/router/navigation_service.dart';
import 'package:contacts_app_isidore/core/router/route_names.dart';
import 'package:contacts_app_isidore/core/service_locator.dart';
import 'package:contacts_app_isidore/core/ui/ui.dart';
import 'package:contacts_app_isidore/core/ui/widgets/app_button.dart';
import 'package:contacts_app_isidore/core/ui/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                // app title
                Align(
                  child: Text(
                    'MyContactsApp',
                    style: AppTextStyles.extraLargeTextPrimary,
                  ),
                ),

                const SizedBox(
                  height: 130,
                ),

                // sign in
                Text(
                  'Sign In',
                  style: AppTextStyles.extraLargeTextPrimary,
                ),

                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Log into your mycontactapp account',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Password',
                      style: AppTextStyles.normalTextPrimary,
                    ),
                    Text(
                      'Forgot password?',
                      style: AppTextStyles.normalTextPrimary2,
                    ),
                  ],
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
                  onPressed: () {},
                  child: Text(
                    'Login',
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
                      text: "Don't have an account?",
                      style: AppTextStyles.smallTextGrey,
                      children: [
                        TextSpan(
                          text: ' Sign Up',
                          style: AppTextStyles.normalTextPrimary2,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => sl<NavigationService>().navigateTo(
                                  RouteNames.signUp,
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
    );
  }
}
