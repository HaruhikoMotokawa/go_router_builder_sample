import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_builder_sample/data/repositories/auth/provider.dart';
import 'package:go_router_builder_sample/data/repositories/maintenance/provider.dart';
import 'package:go_router_builder_sample/data/repositories/tutorial/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_startup_provider.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartup(Ref ref) async {
  ref
    ..read(authRepositoryProvider).init()
    ..read(tutorialRepositoryProvider).init()
    ..read(maintenanceRepositoryProvider).init();
}
