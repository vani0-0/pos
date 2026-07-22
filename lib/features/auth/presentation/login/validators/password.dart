import 'package:formz/formz.dart';

enum PasswordValidationError {
  empty,
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    return value.trim().isEmpty ? PasswordValidationError.empty : null;
  }

  String? get errorMessage {
    switch (displayError) {
      case PasswordValidationError.empty:
        return 'Password is required';

      case null:
        return null;
    }
  }
}
