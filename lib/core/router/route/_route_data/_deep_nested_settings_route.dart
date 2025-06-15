part of '../route.dart';

class DeepNestedSettingsRoute extends GoRouteData
    with _$DeepNestedSettingsRoute {
  const DeepNestedSettingsRoute();

  static const String path = 'deep_nested_settings';
  static const String name = 'deep_nested_settings_screen';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DeepNestedSettingsScreen();
  }
}
