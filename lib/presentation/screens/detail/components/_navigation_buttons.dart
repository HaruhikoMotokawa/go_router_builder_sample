part of '../screen.dart';

/// ユーザー間のナビゲーションを行うボタン
class _NavigationButtons extends StatelessWidget {
  const _NavigationButtons({
    required this.currentUserId,
  });

  final String currentUserId;

  bool get isPreviousAvailable {
    final currentIndex =
        User.list.indexWhere((user) => user.id == currentUserId);
    return currentIndex > 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex =
        User.list.indexWhere((user) => user.id == currentUserId);
    final hasPrevious = currentIndex > 0;
    final hasNext = currentIndex < User.list.length - 1 && currentIndex >= 0;

    final prevUserId = hasPrevious ? User.list[currentIndex - 1].id : null;
    final nextUserId = hasNext ? User.list[currentIndex + 1].id : null;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 前の人ボタン
          Expanded(
            child: ElevatedButton.icon(
              onPressed: hasPrevious
                  ? () {
                      if (prevUserId != null) {
                        context.go('/detail/$prevUserId');
                      }
                    }
                  : null,
              icon: const Icon(Icons.arrow_back),
              label: const Text('前の人'),
            ),
          ),
          const SizedBox(width: 16),
          // 次の人ボタン
          Expanded(
            child: ElevatedButton.icon(
              iconAlignment: IconAlignment.end,
              onPressed: hasNext
                  ? () {
                      if (nextUserId != null) {
                        context.go('/detail/$nextUserId');
                      }
                    }
                  : null,
              icon: const Icon(Icons.arrow_forward),
              label: const Text('次の人'),
            ),
          ),
        ],
      ),
    );
  }
}
