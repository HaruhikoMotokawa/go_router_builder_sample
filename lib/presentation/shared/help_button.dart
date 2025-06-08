import 'package:flutter/material.dart';
import 'package:go_router_builder_sample/core/router/route/route.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.help),
      onPressed: () => const HelpRoute().push<void>(context),
    );
  }
}
