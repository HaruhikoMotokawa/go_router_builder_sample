import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_builder_sample/core/router/route/route.dart';
import 'package:go_router_builder_sample/domain/user.dart';
import 'package:go_router_builder_sample/presentation/shared/help_button.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  static final _owner = User.getById(1);

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
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'User',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            ListTile(
              leading: Icon(_owner.image, color: _owner.color),
              title: Text(_owner.name),
              onTap: () => DetailRoute(userId: _owner.id).push<void>(context),
            ),
          ],
        ),
      ),
    );
  }
}
