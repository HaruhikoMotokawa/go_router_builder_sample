import 'package:flutter/material.dart';
import 'package:go_router_builder_sample/core/router/app_router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.read(appRouterProvider),
    );
  }
}
