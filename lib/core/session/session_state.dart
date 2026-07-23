import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:performance_online_system/features/employee/employee.dart';

part 'session_state.freezed.dart';

@freezed
abstract class SessionState with _$SessionState {
  const factory SessionState.unauthenticated() = UnAuthenticated;

  const factory SessionState.authenticated({
    required Employee employee,
  }) = Authenticated;
}
