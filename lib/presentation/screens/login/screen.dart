import 'package:flutter/material.dart';
import 'package:go_router_builder_sample/data/repositories/auth/provider.dart';
import 'package:go_router_builder_sample/data/repositories/maintenance/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 50,
          children: [
            ElevatedButton(
              onPressed: () => ref.read(authRepositoryProvider).login(),
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () async =>
                  ref.read(maintenanceRepositoryProvider).setMaintenanceMode(),
              child: const Text('５秒で解除されるメンテナンスを発動'),
            ),
          ],
        ),
      ),
    );
  }
}
