part of '../route.dart';

class NestedSettingsRoute extends GoRouteData with _$NestedSettingsRoute {
  const NestedSettingsRoute();

  static const String path = 'nested_settings';
  static const String name = 'nested_settings_screen';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NestedSettingsScreen();
  }
}
