import 'package:flutter/material.dart';
import 'package:go_router_builder_sample/presentation/screens/home/screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
