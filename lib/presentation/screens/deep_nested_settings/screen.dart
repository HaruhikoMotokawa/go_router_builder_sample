import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_builder_sample/core/router/route/route.dart';

class DeepNestedSettingsScreen extends StatelessWidget {
  const DeepNestedSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deep Nested Settings'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Center(
          child: Column(
            spacing: 16,
            children: [
              ElevatedButton(
                onPressed: () => const SettingsRoute().go(context),
                child: const Text('設定画面に戻る'),
              ),
              ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('前の画面に戻る'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
