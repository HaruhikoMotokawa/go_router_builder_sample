import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_builder_sample/core/router/navigation_bar/app_navigation_bar.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({
    required this.navigationShell,
    required this.bottomNavigationBar,
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  final AppNavigationBar bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    // この画面をポップできないようにする
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
