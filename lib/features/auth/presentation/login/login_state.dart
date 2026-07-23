import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:performance_online_system/features/auth/presentation/login/validators/login_form_state.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoginFormState()) LoginFormState form,
    @Default(false) bool showPassword,
    @Default(false) bool isSubmitting,

    String? errorMessage,
  }) = _LoginState;
}
