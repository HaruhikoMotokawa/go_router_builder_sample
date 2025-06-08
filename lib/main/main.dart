import 'package:flutter/material.dart';
import 'package:go_router_builder_sample/main/main_app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}
