import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_builder_sample/data/repositories/auth/provider.dart';
import 'package:go_router_builder_sample/data/repositories/maintenance/provider.dart';
import 'package:go_router_builder_sample/data/repositories/tutorial/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'refresh_listenable.g.dart';

@Riverpod(keepAlive: true)
Raw<ValueNotifier<int>> refreshListenable(Ref ref) {
  final notifier = ValueNotifier<int>(0);

  void notify() {
    // 安全なタイミングまでちょっと待つ
    Future.microtask(() {
      // ValueNotifierの値を更新して通知をトリガー
      notifier.value++;
    });
  }

  // 各状態が変わったときに value を更新して通知をトリガー
  final maintenanceInfoSub =
      ref.listen(isMaintenanceModeProvider, (_, __) => notify());

  final isLoggedInSub = ref.listen(isLoggedInProvider, (_, __) => notify());

  final isTutorialCheckedSub =
      ref.listen(isTutorialCheckedProvider, (_, __) => notify());

  // 万が一、このProviderが破棄された時のクリーンアップ処理
  ref.onDispose(() {
    notifier.dispose();
    isLoggedInSub.close();
    maintenanceInfoSub.close();
    isTutorialCheckedSub.close();
  });

  // ValueNotifierが変更されたときにref.notifyListeners()で依存Providerに通知
  notifier.addListener(() {
    ref.notifyListeners();

    if (kDebugMode) {
      print('⭐️⭐️⭐️ notifier value ${notifier.value} ⭐️⭐️⭐️');
    }
  });

  return notifier;
}
