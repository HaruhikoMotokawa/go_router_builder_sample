import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_builder_sample/core/router/route/route.dart';
import 'package:go_router_builder_sample/data/repositories/auth/provider.dart';
import 'package:go_router_builder_sample/data/repositories/maintenance/provider.dart';
import 'package:go_router_builder_sample/data/repositories/tutorial/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller.g.dart';

@Riverpod(keepAlive: true)
RedirectController redirectController(Ref ref) => RedirectController(ref);

class RedirectController {
  RedirectController(this.ref);

  final Ref ref;

  /// リダイレクト処理を行う
  FutureOr<String?> call(BuildContext context, GoRouterState state) async {
    // 現在のパスを取得
    final fullPath = state.fullPath;

    // メンテナンスモードの状態を取得
    final isMaintenanceMode = await ref.read(isMaintenanceModeProvider.future);

    // メンテナンスモードの場合はメンテナンス画面へリダイレクト
    if (isMaintenanceMode) return _maintenanceGuard(fullPath);

    // ログイン状態を取得
    final isLoggedIn = await ref.read(isLoggedInProvider.future);

    // ログインしているかどうかでリダイレクト先を決定
    if (isLoggedIn) return _authGuard(fullPath);

    // ログインしていない場合のリダイレクト処理
    return _noAuthGuard(fullPath);
  }

  /// メンテナンスモードの場合のリダイレクト処理
  Future<String?> _maintenanceGuard(String? fullPath) async {
    // メンテナンスモード中は全ての画面をメンテナンス画面にリダイレクト
    if (fullPath != const MaintenanceRoute().location) {
      return const MaintenanceRoute().location;
    }

    return null;
  }

  /// ログインしている場合のリダイレクト処理
  Future<String?> _authGuard(String? fullPath) async {
    final isTutorialChecked = await ref.read(isTutorialCheckedProvider.future);

    // チュートリアルが未完了の場合はチュートリアル画面へリダイレクト;
    if (!isTutorialChecked) return _tutorialGuard(fullPath);

    // チュートリアルが完了している場合はホーム画面へリダイレクト
    if (fullPath == const LoginRoute().location ||
        fullPath == const MaintenanceRoute().location ||
        fullPath == const TutorialRoute().location) {
      return const HomeRoute().location;
    }

    return null;
  }

  /// チュートリアルが完了していない場合のリダイレクト処理
  Future<String?> _tutorialGuard(String? fullPath) async {
    // チュートリアルが未完了の場合はチュートリアル画面へリダイレクト
    if (fullPath != const TutorialRoute().location) {
      return const TutorialRoute().location;
    }
    return null;
  }

  /// ログインしていない場合のリダイレクト処理
  Future<String?> _noAuthGuard(String? fullPath) async {
    if (fullPath != const LoginRoute().location) {
      return const LoginRoute().location;
    }
    return null;
  }
}
