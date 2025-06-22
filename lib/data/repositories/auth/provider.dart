import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_builder_sample/data/repositories/auth/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) => AuthRepository();

@Riverpod(keepAlive: true)
Stream<bool> isLoggedIn(Ref ref) => ref.read(authRepositoryProvider).isLoggedIn;

@Riverpod(keepAlive: true)
Stream<bool> isTutorialChecked(Ref ref) =>
    ref.read(authRepositoryProvider).isTutorialChecked;
