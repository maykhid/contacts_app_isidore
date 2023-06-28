import 'package:form_validator/form_validator.dart';

extension CustomValidationBuilder on ValidationBuilder {
  ValidationBuilder password() => add((value) {
        if (value!.length < 6) {
          return 'Your password should contain at least 6 characters';
        }
        return null;
      });

  ValidationBuilder name() => add((value) {
        if (value!.isEmpty) {
          return 'Please input name';
        } else if (value.length < 3) {
          return 'Name is too short';
        }
        return null;
      });

  ValidationBuilder homeAddress() => add((value) {
        if (value!.isEmpty) {
          return 'Please input home address';
        } else if (value.length < 6) {
          return 'home address is too short';
        }
        return null;
      });
}
