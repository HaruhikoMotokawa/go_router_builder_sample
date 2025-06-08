import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_builder_sample/core/router/route/route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    routes: $appRoutes,
    errorPageBuilder: (context, state) => const MaterialPage(
      child: _ErrorPage(),
    ),
  );
}

/// パスが見つからなかった場合のエラーページ
///
/// 例）DeepLink経由でのパスが見つからなかった場合など
class _ErrorPage extends HookWidget {
  const _ErrorPage();

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          final result = await showDialog<int>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Error'),
                content: const Text('Page not found'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(0),
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
          if (result == 0 && context.mounted) {
            context.go(const HomeRoute().location);
          }
        });
        return null;
      },
      [],
    );
    return const Scaffold(
      body: SizedBox(),
    );
  }
}
