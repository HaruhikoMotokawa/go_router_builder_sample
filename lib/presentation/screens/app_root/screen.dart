import 'package:flutter/material.dart';

class AppRootScreen extends StatelessWidget {
  const AppRootScreen({
    required this.navigator,
    super.key,
  });

  final Widget navigator;

  @override
  Widget build(BuildContext context) {
    // この画面は常にポップできないようにする
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: navigator,
      ),
    );
  }
}
