import 'package:contacts_app_isidore/app/feature/sign_in/data/data_source/repository/sign_in_repository.dart';
import 'package:contacts_app_isidore/app/feature/sign_up/data/repository/sign_up_repository.dart';
import 'package:contacts_app_isidore/app/feature/sign_up/ui/provider/sign_up_provider.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/loading_state.dart';
import 'package:contacts_app_isidore/core/extensions/sized_context.dart';
import 'package:contacts_app_isidore/core/extensions/validation_extension.dart';
import 'package:contacts_app_isidore/core/router/navigation_service.dart';
import 'package:contacts_app_isidore/core/router/route_names.dart';
import 'package:contacts_app_isidore/core/service_locator.dart';
import 'package:contacts_app_isidore/core/ui/ui.dart';
import 'package:contacts_app_isidore/core/ui/widgets/app_snackbar.dart';
import 'package:contacts_app_isidore/core/ui/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  final _emailValidator = ValidationBuilder().email().build();
  final _passwordValidator = ValidationBuilder().password().build();

  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _confrimPassword = '';

  bool _showPassword = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(
        signUpRepository: sl<SignUpRepository>(),
        signInRepository: sl<SignInRepository>(),
      ),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox.expand(
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
                        controller: _emailController,
                        validate: _emailValidator,
                        onSaved: (String? email) => _email = email!,
                        textInputType: TextInputType.emailAddress,
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
                        controller: _passwordController,
                        validate: _passwordValidator,
                        textInputAction: TextInputAction.unspecified,
                        obscureText: _showPassword,
                        onSaved: (String? password) => _password = password!,
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          child: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey.withOpacity(0.4),
                          ),
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
                        controller: _confirmpasswordController,
                        obscureText: _showPassword,
                        textInputAction: TextInputAction.unspecified,
                        onSaved: (String? password) =>
                            _confrimPassword = password!,
                        validate: (password) {
                          if (_passwordController.text != password) {
                            return 'Both Passwords are not the same.';
                          }
                          return null;
                        },
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          child: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 25,
                      ),

                      // login btn
                      Consumer<SignUpProvider>(
                        builder: (context, signUpProvider, _) {
                          return AppButton(
                            isLoading: signUpProvider.loadingState ==
                                LoadingState.busy,
                            width: context.width,
                            onPressed: () => _handleSignUp(signUpProvider),
                            child: Text(
                              'Create Account',
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
                            text: 'Already have an account?',
                            style: AppTextStyles.smallTextGrey,
                            children: [
                              TextSpan(
                                text: ' Sign In',
                                style: AppTextStyles.normalTextPrimary2,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => sl<NavigationService>()
                                          .navigateToReplacement(
                                        RouteNames.signIn,
                                      ),
                              ),
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
      ),
    );
  }

  Future<void> _handleSignUp(SignUpProvider signUpProvider) async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      await signUpProvider.signUp(_email, _password, _confrimPassword);

      if (signUpProvider.loadingState == LoadingState.done) {
        await sl<NavigationService>()
            .navigateToReplacement(RouteNames.verificationSent);
      } else {
        // show error
        // ignore: use_build_context_synchronously
        AppSnackBar.showErrorSnackBar(context, signUpProvider.errorMsg);
      }
    }
  }
}
