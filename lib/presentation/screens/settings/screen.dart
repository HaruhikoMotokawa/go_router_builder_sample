import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_builder_sample/presentation/shared/help_button.dart';

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
        actions: const [
          HelpButton(),
        ],
      ),
      body: const Center(
        child: Text('Settings Screen'),
      ),
    );
  }
}
