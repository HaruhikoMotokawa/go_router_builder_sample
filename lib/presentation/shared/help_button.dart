import 'package:flutter/material.dart';
import 'package:go_router_builder_sample/core/router/route/route.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({
    required this.isBadSelectGo,
    super.key,
  });

  final bool isBadSelectGo;

  String get pushStatus => isBadSelectGo ? '👌 ' : '一応👌 ';

  String get goStatus => isBadSelectGo ? '👎 ' : '👌 ';
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.help_outline),
      onSelected: (value) {
        if (value == 'push') {
          const HelpRoute().push<void>(context);
        }
        if (value == 'go') {
          const HelpRoute().go(context);
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'push',
          child: Text('$pushStatus pushでヘルプ画面へ遷移する'),
        ),
        PopupMenuItem(
          value: 'go',
          child: Text('$goStatus goでヘルプ画面へ遷移する'),
        ),
      ],
    );
  }
}
