part of '../route.dart';

class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  static const String path = '/settings';
  static const String name = 'settings_screen';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsScreen();
  }
}
