import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_builder_sample/data/repositories/maintenance/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
MaintenanceRepository maintenanceRepository(Ref ref) => MaintenanceRepository();

@Riverpod(keepAlive: true)
Stream<bool> isMaintenanceMode(Ref ref) =>
    ref.read(maintenanceRepositoryProvider).isMaintenanceMode;
