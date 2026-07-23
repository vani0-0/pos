import 'package:performance_online_system/core/errors/api_exception.dart';
import 'package:performance_online_system/core/session/session_service.dart';
import 'package:performance_online_system/features/auth/data/auth_provider.dart';
import 'package:performance_online_system/features/auth/domain/repositories/auth_repository.dart';
import 'package:performance_online_system/features/auth/presentation/login/login_state.dart';
import 'package:performance_online_system/features/auth/presentation/login/validators/employee_id.dart';
import 'package:performance_online_system/features/auth/presentation/login/validators/login_form_state.dart';
import 'package:performance_online_system/features/auth/presentation/login/validators/password.dart';
import 'package:performance_online_system/features/employee/domain/entities/employee.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() => const LoginState();

  AuthRepository get _repository => ref.read(authRepositoryProvider);

  void updateEmployeeId(String input) {
    state = state.copyWith(
      form: state.form.copyWith(employeeId: EmployeeId.dirty(input)),
      errorMessage: null,
    );
  }

  void updatePassword(String input) {
    state = state.copyWith(
      form: state.form.copyWith(password: Password.dirty(input)),
      errorMessage: null,
    );
  }

  void toggleShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  Future<void> login() async {
    final form = LoginFormState(
      employeeId: EmployeeId.dirty(state.form.employeeId.value),
      password: Password.dirty(state.form.password.value),
    );

    state = state.copyWith(errorMessage: null, form: form);

    if (form.isNotValid) {
      state = state.copyWith(errorMessage: 'Please correct the highlighted fields.');
      return;
    }

    state = state.copyWith(isSubmitting: true, form: form, errorMessage: null);

    try {
      final Employee employee = await _repository.login(
        employeeId: form.employeeId.value,
        password: form.password.value,
      );

      ref.read(sessionServiceProvider.notifier).login(employee);
    } on ApiException catch (e) {
      state = state.copyWith(errorMessage: e.message);
    } finally {
      state = state.copyWith(isSubmitting: false);
    }
  }
}
