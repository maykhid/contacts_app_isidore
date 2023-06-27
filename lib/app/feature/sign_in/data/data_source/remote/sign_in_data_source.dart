// ignore_for_file: one_member_abstracts

import 'package:contacts_app_isidore/app/feature/sign_in/data/models/sign_in_response.dart';

abstract class SignInDataSource {
  Future<SignInResponse> signIn(String email, String password);
}
