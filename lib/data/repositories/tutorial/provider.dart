import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_builder_sample/data/repositories/tutorial/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
TutorialRepository tutorialRepository(Ref ref) => TutorialRepository();

@Riverpod(keepAlive: true)
Stream<bool> isTutorialChecked(Ref ref) =>
    ref.read(tutorialRepositoryProvider).isTutorialChecked;
