import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/router.dart';
import '../features/auth/presentation/login_page.dart';
import '../features/auth/providers/auth_providers.dart';
import '../features/home/presentation/home_page.dart';
import '../features/meetings/presentation/meeting_page.dart';
import '../features/notification/presentation/notification_page.dart';
import '../features/profile/presentaion/profile_page.dart';
import '../features/reset-password/presentation/reset_password.dart';
import '../widgets/app_scaffold.dart';
import 'router_notifier.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = RouterNotifier(ref);

  return GoRouter(
    initialLocation: RouteString.login,
    debugLogDiagnostics: true,
    refreshListenable: notifier,
    routes: [
      // 🔹 Login Page (standalone, outside of bottom nav)
      GoRoute(
        path: RouteString.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: RouteString.resetPassword,
        builder: (context, state) => const ResetPasswordPage(),
      ),

      // 🔹 Bottom navigation shell
      ShellRoute(
        builder: (context, state, child) => AppScaffold(child: child),
        routes: [
          GoRoute(
            path: RouteString.home,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomePage()),
          ),
          GoRoute(
            path: RouteString.meetings,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: MeetingPage()),
          ),
          GoRoute(
            path: RouteString.notifications,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: NotificationPage()),
          ),
          GoRoute(
            path: RouteString.profile,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProfilePage()),
          ),
        ],
      ),
    ],

    // 🔹 Redirect logic for auth
    redirect: (context, state) {
      final isLoggedIn = ref.read(authControllerProvider).isAuthenticated;

      final loggingIn = state.matchedLocation == '/login';

      if (!isLoggedIn) return loggingIn ? null : '/login';
      if (isLoggedIn && loggingIn) return '/home';
      return null;
    },
  );
});
