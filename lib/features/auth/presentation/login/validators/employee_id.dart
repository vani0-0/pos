import 'package:formz/formz.dart';

enum EmployeeIdValidationError {
  empty,
  invalidPrefix,
  missingNumber,
  invalidNumber,
}

class EmployeeId extends FormzInput<String, EmployeeIdValidationError> {
  const EmployeeId.pure() : super.pure('');
  const EmployeeId.dirty([super.value = '']) : super.dirty();

  static const _allowedAbbreviations = ['trb', 'cybr'];

  @override
  EmployeeIdValidationError? validator(String value) {
    final String input = value.trim();
    if (input.isEmpty) {
      return EmployeeIdValidationError.empty;
    }

    final String lower = input.toLowerCase();
    final String abbreviation = _allowedAbbreviations.firstWhere(
      (abbr) => lower.startsWith(abbr),
      orElse: () => '',
    );

    if (abbreviation.isEmpty) {
      return EmployeeIdValidationError.invalidPrefix;
    }

    final String numericPart = input.substring(abbreviation.length);
    final int? employeeNumber = int.tryParse(numericPart);

    if (employeeNumber == null) {
      return EmployeeIdValidationError.missingNumber;
    }

    if (employeeNumber <= 4) {
      return EmployeeIdValidationError.missingNumber;
    }

    return null;
  }

  String? get errorMessage {
    switch (displayError) {
      case EmployeeIdValidationError.empty:
        return 'Employee ID is required';

      case EmployeeIdValidationError.invalidPrefix:
        return 'Employee ID must start with ${_allowedAbbreviations.join(" or ").toUpperCase()}';

      case EmployeeIdValidationError.missingNumber:
        return 'Please enter your employee number.';

      case EmployeeIdValidationError.invalidNumber:
        return 'Invalid employee number.';

      case null:
        return null;
    }
  }
}
