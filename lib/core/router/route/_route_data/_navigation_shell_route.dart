part of '../route.dart';

/// ナビゲーションバーを含めた土台のシェルルート。
class NavigationShellRoute extends StatefulShellRouteData {
  const NavigationShellRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AppNavigationBar(
        navigationShell: navigationShell,
      ),
    );
  }
}
