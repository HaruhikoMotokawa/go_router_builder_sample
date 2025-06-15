import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_builder_sample/presentation/screens/app_root/screen.dart';
import 'package:go_router_builder_sample/presentation/screens/detail/screen.dart';
import 'package:go_router_builder_sample/presentation/screens/help/screen.dart';
import 'package:go_router_builder_sample/presentation/screens/home/screen.dart';
import 'package:go_router_builder_sample/presentation/screens/navigation/screen.dart';
import 'package:go_router_builder_sample/presentation/screens/settings/screen.dart';

part '_route_data/_branch_data.dart';
part '_route_data/_detail_route.dart';
part '_route_data/_help_route.dart';
part '_route_data/_home_route.dart';
part '_route_data/_navigation_shell_route.dart';
part '_route_data/_settings_route.dart';
part 'route.g.dart';

/// アプリケーション全体のナビゲーションを管理するためのキー。
/// このキーを使うことで、アプリケーションのどこからでも
/// ナビゲーターに直接アクセスし、画面遷移を制御することができる。
final rootNavigationKey = GlobalKey<NavigatorState>();

/// アプリケーションの大元に位置するシェルルート
// このアノテーションはAppShellRouteにつける必要がある
@TypedShellRoute<AppShellRoute>(
  routes: [
    TypedStatefulShellRoute<NavigationShellRoute>(
      branches: [
        TypedStatefulShellBranch<HomeBranch>(
          routes: [
            TypedGoRoute<HomeRoute>(
              path: HomeRoute.path,
              name: HomeRoute.name,
              routes: [
                TypedGoRoute<DetailRoute>(
                  path: DetailRoute.path,
                  name: DetailRoute.name,
                ),
              ],
            ),
          ],
        ),
        TypedStatefulShellBranch<SettingsBranch>(
          routes: [
            TypedGoRoute<SettingsRoute>(
              path: SettingsRoute.path,
              name: SettingsRoute.name,
              routes: [
                TypedGoRoute<HelpRoute>(
                  path: HelpRoute.path,
                  name: HelpRoute.name,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
)
class AppShellRoute extends ShellRouteData {
  const AppShellRoute();

  static final GlobalKey<NavigatorState> $navigationKey = rootNavigationKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return AppRootScreen(navigator: navigator);
  }
}
