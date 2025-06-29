part of '../route.dart';

/// ログイン画面へのルート情報。
class LoginRoute extends GoRouteData with _$LoginRoute {
  const LoginRoute();

  static const String path = '/login';
  static const String name = 'login_screen';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}
