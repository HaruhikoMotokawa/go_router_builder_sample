part of '../screen.dart';

/// アプリのナビゲーションバーを設定する
class _AppNavigationBar extends StatelessWidget {
  const _AppNavigationBar({
    required this.navigationShell,
  });

  /// StatefulShellRouteの状態を管理するウィジェット
  ///
  /// go_routerの機能
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      // StatefulNavigationShellが保持している現在のインデックスを割り当てる
      selectedIndex: navigationShell.currentIndex,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      onDestinationSelected: _select,
    );
  }

  /// タブをタップした際の処理
  ///
  /// 引数のインデックスに該当するブランチに移動し、
  void _select(int index) {
    // ナビゲーションシェルのページを切り替える
    navigationShell.goBranch(
      // 移動するブランチのインデックス
      index,
      // ブランチのルートページに戻すかどうか
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
