import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'components/_app_navigation_bar.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    // この画面をポップできないようにする
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: _AppNavigationBar(
          navigationShell: navigationShell,
        ),
      ),
    );
  }
}
