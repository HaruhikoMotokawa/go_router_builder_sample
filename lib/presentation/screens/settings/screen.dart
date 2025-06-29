import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_builder_sample/core/router/route/route.dart';
import 'package:go_router_builder_sample/data/repositories/auth/provider.dart';
import 'package:go_router_builder_sample/data/repositories/maintenance/provider.dart';
import 'package:go_router_builder_sample/domain/user.dart';

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
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () => const HelpRoute().go(context),
          ),
        ],
      ),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: 7,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return Text(
                  'User',
                  style: Theme.of(context).textTheme.titleMedium,
                );
              case 1:
                return ListTile(
                  leading: Icon(_owner.image, color: _owner.color),
                  title: Text(_owner.name),
                  onTap: () =>
                      DetailRoute(userId: _owner.id).push<void>(context),
                );

              case 2:
                return ElevatedButton(
                  onPressed: () => context.go('/fake_path'),
                  child: const Text('不正なパスで遷移する'),
                );
              case 3:
                return ElevatedButton(
                  onPressed: () => ref.read(authRepositoryProvider).logout(),
                  child: const Text('ログアウトする'),
                );
              case 4:
                return ElevatedButton(
                  onPressed: () => const MaintenanceRoute().go(context),
                  child: const Text('MaintenanceRoute().go() してみる'),
                );
              case 5:
                return ElevatedButton(
                  onPressed: () async => ref
                      .read(maintenanceRepositoryProvider)
                      .setMaintenanceMode(),
                  child: const Text('５秒で解除されるメンテナンスを発動'),
                );

              default:
                return const SizedBox.shrink();
            }
          },
          separatorBuilder: (context, index) => const SizedBox(height: 16),
        ),
      ),
    );
  }
}
