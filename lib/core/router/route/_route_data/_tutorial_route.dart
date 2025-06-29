part of '../route.dart';

/// チュートリアル画面へのルート情報。
class TutorialRoute extends GoRouteData with _$TutorialRoute {
  const TutorialRoute();

  static const String path = '/tutorial';
  static const String name = 'tutorial_screen';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TutorialScreen();
  }
}
