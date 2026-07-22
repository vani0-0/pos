import 'package:performance_online_system/features/auth/presentation/login/login_state.dart';
import 'package:performance_online_system/features/auth/presentation/login/validators/employee_id.dart';
import 'package:performance_online_system/features/auth/presentation/login/validators/login_form_state.dart';
import 'package:performance_online_system/features/auth/presentation/login/validators/password.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() => const LoginState();

  void updateEmployeeId(String input) {
    state = state.copyWith(
      form: state.form.copyWith(employeeId: EmployeeId.dirty(input)),
      formError: null,
    );
  }

  void updatePassword(String input) {
    state = state.copyWith(
      form: state.form.copyWith(password: Password.dirty(input)),
      formError: null,
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

    state = state.copyWith(formError: null, form: form);

    if (form.isNotValid) {
      state = state.copyWith(formError: 'Please correct the highlighted fields.');
      return;
    }

    state = state.copyWith(isSubmitting: true, form: form);

    try {
      // Login...
    } finally {
      state = state.copyWith(isSubmitting: false);
    }
  }
}
