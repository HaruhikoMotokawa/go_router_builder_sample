part of '../screen.dart';

/// ユーザー間のナビゲーションを行うボタン
class _NavigationButtons extends StatelessWidget {
  const _NavigationButtons({
    required this.currentUserId,
  });

  final int currentUserId;

  bool get isPreviousAvailable => currentUserId != 1;

  bool get isNextAvailable => currentUserId < User.list.length;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 前の人ボタン
          Expanded(
            child: ElevatedButton.icon(
              onPressed: isPreviousAvailable
                  ? () {
                      final userId = currentUserId - 1;
                      DetailRoute(userId: userId).replace(context);
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
              onPressed: isNextAvailable
                  ? () {
                      final userId = currentUserId + 1;
                      DetailRoute(userId: userId).replace(context);
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
