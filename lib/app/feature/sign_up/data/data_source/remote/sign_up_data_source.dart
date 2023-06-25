// ignore_for_file: one_member_abstracts

import 'package:contacts_app_isidore/app/feature/sign_up/data/model/sign_up_response.dart';

abstract class SignUpDataSource {
  Future<SignUpResponse> signUp();
}
