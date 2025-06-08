part of '../route.dart';

class DetailRoute extends GoRouteData with _$DetailRoute {
  const DetailRoute();

  static const String path = 'detail';
  static const String name = 'detail_screen';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DetailScreen();
  }
}
