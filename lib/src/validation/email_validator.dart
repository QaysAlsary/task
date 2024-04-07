
import 'base_validator.dart';

class EmailValidator extends BaseValidator {

  @override
  String get msgKey => "email_validator";

  @override
  bool valid(String? input) =>
      input != null &&
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(input);
}
