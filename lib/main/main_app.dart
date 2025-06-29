import 'package:flutter/material.dart';
import 'package:go_router_builder_sample/core/router/app_router/app_router.dart';
import 'package:go_router_builder_sample/main/app_startup_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAppStartup = ref.watch(appStartupProvider);

    return switch (asyncAppStartup) {
      AsyncError(:final error, :final stackTrace) => MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text('Error: $error\n$stackTrace'),
            ),
          ),
        ),
      AsyncData() => MaterialApp.router(
          routerConfig: ref.read(appRouterProvider),
        ),
      _ => const MaterialApp(
          home: Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
        ),
    };
  }
}
