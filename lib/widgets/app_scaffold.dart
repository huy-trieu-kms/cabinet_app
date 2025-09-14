import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/router.dart';
import 'app_bottom_nav.dart'; // Import the new widget

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

class AppScaffold extends ConsumerWidget {
  final Widget child;
  const AppScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomNavIndexProvider);

    void onTap(int i) {
      ref.read(bottomNavIndexProvider.notifier).state = i;
      switch (i) {
        case 0:
          context.go(RouteString.home);
          break;
        case 1:
          context.go(RouteString.meetings);
          break;
        case 2:
          context.go(RouteString.notifications);
          break;
        case 3:
          context.go(RouteString.profile);
      }
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: AppBottomNav(
        currentIndex: index,
        onTap: onTap,
        icons: const [
          Icons.home,
          Icons.video_call,
          Icons.notifications,
          Icons.person,
        ],
      ),
    );
  }
}
