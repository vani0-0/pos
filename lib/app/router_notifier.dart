import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:performance_online_system/app/app_routes.dart';
import 'package:performance_online_system/core/session/session_service.dart';
import 'package:performance_online_system/core/session/session_state.dart';

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this._ref) {
    _ref.listen(sessionServiceProvider, (_, _) {
      notifyListeners();
    });
  }

  final Ref _ref;

  SessionState get _sessionState => _ref.read(sessionServiceProvider);

  String? redirect(BuildContext context, GoRouterState state) {
    final loggedIn = _sessionState is Authenticated;
    final onLogin = state.matchedLocation == '/login';

    if (!loggedIn && !onLogin) {
      return AppRoutes.login;
    }

    if (loggedIn && onLogin) {
      return AppRoutes.dashboard;
    }

    return null;
  }
}
