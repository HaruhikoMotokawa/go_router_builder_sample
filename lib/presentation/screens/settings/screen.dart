import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_builder_sample/core/router/route/route.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.help),
            onPressed: () => const HelpRoute().go(context),
          )
        ],
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () => context.go('/fake_path'),
        child: const Text('不正なパスで遷移する'),
      )),
    );
  }
}
