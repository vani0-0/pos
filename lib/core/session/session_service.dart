import 'package:performance_online_system/core/session/session_state.dart';
import 'package:performance_online_system/features/employee/employee.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_service.g.dart';

@riverpod
class SessionService extends _$SessionService {
  @override
  SessionState build() {
    return const SessionState.unauthenticated();
  }

  void login(Employee employee) {
    state = SessionState.authenticated(employee: employee);
  }

  void logout() {
    state = const SessionState.unauthenticated();
  }
}
