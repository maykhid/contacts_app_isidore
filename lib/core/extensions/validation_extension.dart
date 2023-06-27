import 'package:form_validator/form_validator.dart';

extension CustomValidationBuilder on ValidationBuilder {
  ValidationBuilder password() => add((value) {
        if (value!.length < 6) {
          return 'Your password should contain at least 6 characters';
        }
        return null;
      });
}
