import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_builder_sample/core/router/route/route.dart';
import 'package:go_router_builder_sample/data/repositories/auth/provider.dart';
import 'package:go_router_builder_sample/data/repositories/maintenance/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller.g.dart';

@Riverpod(keepAlive: true)
RedirectController redirectController(Ref ref) => RedirectController(ref);

class RedirectController {
  RedirectController(this.ref);

  final Ref ref;

  FutureOr<String?> call(BuildContext context, GoRouterState state) async {
    final (isMaintenanceMode, isLoggedIn) = await (
      ref.read(isMaintenanceModeProvider.future),
      ref.read(isLoggedInProvider.future),
    ).wait;

    if (isMaintenanceMode) return const MaintenanceRoute().location;

    if (!isLoggedIn) return _noAuthGuard(state);

    return _authGuard(state);
  }

  /// ログインしていない場合のリダイレクト処理
  Future<String?> _noAuthGuard(GoRouterState state) async {
    if (state.fullPath != const LoginRoute().location) {
      return const LoginRoute().location;
    }
    return null;
  }

  /// ログインしている場合のリダイレクト処理
  Future<String?> _authGuard(GoRouterState state) async {
    final isTutorialChecked = await ref.read(isTutorialCheckedProvider.future);

    // チュートリアルが未完了の場合はチュートリアル画面へリダイレクト
    if (!isTutorialChecked) return const TutorialRoute().location;

    // チュートリアルが完了している場合はホーム画面へリダイレクト
    if (state.fullPath == const LoginRoute().location ||
        state.fullPath == const MaintenanceRoute().location ||
        state.fullPath == const TutorialRoute().location) {
      return const HomeRoute().location;
    }

    return null;
  }
}
