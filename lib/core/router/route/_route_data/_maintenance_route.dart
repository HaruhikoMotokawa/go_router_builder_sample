part of '../route.dart';

/// メンテナンス中画面へのルート情報
class MaintenanceRoute extends GoRouteData with _$MaintenanceRoute {
  const MaintenanceRoute();

  static const String path = '/maintenance';
  static const String name = 'maintenance_screen';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MaintenanceScreen();
  }
}
