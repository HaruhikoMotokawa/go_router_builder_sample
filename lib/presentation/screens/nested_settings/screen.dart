import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_builder_sample/core/router/route/route.dart';

class NestedSettingsScreen extends StatelessWidget {
  const NestedSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nested Settings'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Center(
            child: Column(
          spacing: 16,
          children: [
            ElevatedButton(
              onPressed: () => const DeepNestedSettingsRoute().go(context),
              child: const Text('さらに深い階層へ進む (Deep Nested Settings)'),
            ),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('前の画面に戻る'),
            )
          ],
        )),
      ),
    );
  }
}
