part of '../route.dart';

class HelpRoute extends GoRouteData with _$HelpRoute {
  const HelpRoute();

  static const String path = 'help';
  static const String name = 'help_screen';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HelpScreen();
  }
}
