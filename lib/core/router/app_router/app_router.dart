import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_builder_sample/core/router/redirect/controller.dart';
import 'package:go_router_builder_sample/core/router/redirect/refresh_listenable.dart';
import 'package:go_router_builder_sample/core/router/route/route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';
part 'components/_error_page.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: const LoginRoute().location,
    routes: $appRoutes,
    refreshListenable: ref.read(refreshListenableProvider),
    redirect: ref.read(redirectControllerProvider).call,
    errorPageBuilder: (context, state) => const MaterialPage(
      child: _ErrorPage(),
    ),
  );
}
