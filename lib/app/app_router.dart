import 'package:go_router/go_router.dart';
import 'package:performance_online_system/app/app_routes.dart';
import 'package:performance_online_system/app/router_notifier.dart';
import 'package:performance_online_system/features/auth/auth.dart';
import 'package:performance_online_system/features/dashboard/dashboard.dart';
import 'package:performance_online_system/features/shell/presentation/shell_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final routerNotifier = RouterNotifier(ref);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: routerNotifier,
    redirect: routerNotifier.redirect,
    routes: [
      GoRoute(path: AppRoutes.splash, builder: (context, state) => const SplashScreen()),
      GoRoute(path: AppRoutes.login, builder: (context, state) => const LoginScreen()),
      ShellRoute(
        builder: (context, state, child) => ShellScreen(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.dashboard,
            builder: (context, state) => const DashboardScreen(),
          ),
        ],
      ),
    ],
  );
}
