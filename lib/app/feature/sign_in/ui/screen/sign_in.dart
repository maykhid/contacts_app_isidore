import 'package:contacts_app_isidore/app/feature/sign_in/data/data_source/repository/sign_in_repository.dart';
import 'package:contacts_app_isidore/app/feature/sign_in/ui/provider/sign_in_provider.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/loading_state.dart';
import 'package:contacts_app_isidore/core/extensions/sized_context.dart';
import 'package:contacts_app_isidore/core/extensions/validation_extension.dart';
import 'package:contacts_app_isidore/core/router/navigation_service.dart';
import 'package:contacts_app_isidore/core/router/route_names.dart';
import 'package:contacts_app_isidore/core/service_locator.dart';
import 'package:contacts_app_isidore/core/ui/ui.dart';
import 'package:contacts_app_isidore/core/ui/widgets/app_button.dart';
import 'package:contacts_app_isidore/core/ui/widgets/app_snackbar.dart';
import 'package:contacts_app_isidore/core/ui/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _emailValidator = ValidationBuilder().email().build();
  final _passwordValidator = ValidationBuilder().password().build();

  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          SignInProvider(signInRepository: sl<SignInRepository>()),
      child: Scaffold(
        body: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      controller: _emailController,
                      validate: _emailValidator,
                      onSaved: (String? email) => _email = email!,
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
                      controller: _passwordController,
                      validate: _passwordValidator,
                      onSaved: (String? password) => _password = password!,
                      suffixIcon: Icon(
                        Icons.remove_red_eye_rounded,
                        color: Colors.grey.withOpacity(0.4),
                      ),
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    // login btn
                    Consumer<SignInProvider>(
                      builder: (context, signInProvider, _) {
                        return AppButton(
                          isLoading:
                              signInProvider.loadingState == LoadingState.busy,
                          width: context.width,
                          onPressed: () => _handleSignIn(signInProvider),
                          child: Text(
                            'Login',
                            style: AppTextStyles.normalTextWhite,
                          ),
                        );
                      },
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
                                ..onTap = () => sl<NavigationService>()
                                        .navigateToReplacement(
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
        ),
      ),
    );
  }

  Future<void> _handleSignIn(SignInProvider signInProvider) async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      await signInProvider.signIn(_email, _password);

      if (signInProvider.loadingState == LoadingState.done) {
        await sl<NavigationService>().navigateToReplacement(RouteNames.home);
      } else {
        // show error
        // ignore: use_build_context_synchronously
        AppSnackBar.showErrorSnackBar(context, signInProvider.errorMsg);
      }
    }
  }
}
