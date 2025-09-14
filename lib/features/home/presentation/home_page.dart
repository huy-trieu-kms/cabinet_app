import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/connectivity_banner.dart';
import '../../auth/providers/auth_providers.dart';
import 'widgets/home_header.dart';
import 'widgets/home_calendar.dart';
import 'widgets/home_schedule.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
        actions: [
          IconButton(
            onPressed: () async {
              await ref.read(authControllerProvider.notifier).logout();
              if (context.mounted) context.go('/login');
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Sign out',
          ),
        ],
      ),
      body: Column(
        children: const [
          ConnectivityBanner(),
          Expanded(
            child: Column(
              children: [
                HomeHeader(),
                Divider(height: 1),
                Expanded(
                  child: Column(
                    children: [
                      HomeCalendar(),
                      Expanded(child: HomeSchedule()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
