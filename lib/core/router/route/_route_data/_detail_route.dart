part of '../route.dart';

class DetailRoute extends GoRouteData with _$DetailRoute {
  const DetailRoute({required this.userId});

  static const String path = 'detail/:userId';
  static const String name = 'detail_screen';

  final int userId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DetailScreen(userId: userId);
  }
}
