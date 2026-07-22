import 'package:formz/formz.dart';
import 'package:performance_online_system/features/auth/presentation/login/validators/employee_id.dart';
import 'package:performance_online_system/features/auth/presentation/login/validators/password.dart';

class LoginFormState with FormzMixin {
  const LoginFormState({
    this.employeeId = const EmployeeId.pure(),
    this.password = const Password.pure(),
  });

  final EmployeeId employeeId;
  final Password password;

  @override
  List<FormzInput> get inputs => [employeeId, password];

  LoginFormState copyWith({EmployeeId? employeeId, Password? password}) {
    return LoginFormState(
      employeeId: employeeId ?? this.employeeId,
      password: password ?? this.password,
    );
  }
}
