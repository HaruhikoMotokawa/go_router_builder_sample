part of '../route.dart';

class HomeRoute extends GoRouteData with _$HomeRoute {
  const HomeRoute();

  static const String path = '/';
  static const String name = 'home_screen';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}
