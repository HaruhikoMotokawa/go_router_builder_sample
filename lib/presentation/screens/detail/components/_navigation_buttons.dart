part of '../screen.dart';

enum _NavigationType {
  go,
  push,
  replace,
}

/// ユーザー間のナビゲーションを行うボタン
class _NavigationButtons extends HookWidget {
  const _NavigationButtons({
    required this.currentUserId,
  });

  final int currentUserId;
  bool get _isPreviousAvailable => currentUserId != 1;
  bool get _isNextAvailable => currentUserId < User.list.length;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 前の人ボタン
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _isPreviousAvailable
                      ? () => _navigateToUser(
                            context,
                            shouldNext: false,
                          )
                      : null,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('前の人'),
                ),
              ),
              // 次の人ボタン
              Expanded(
                child: ElevatedButton.icon(
                  iconAlignment: IconAlignment.end,
                  onPressed: _isNextAvailable
                      ? () => _navigateToUser(
                            context,
                            shouldNext: true,
                          )
                      : null,
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('次の人'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

extension on _NavigationButtons {
  /// ここは本当はreplaceを使うべきだが、検証のためにあえて選べるようにしている
  void _navigateToUser(
    BuildContext context, {
    required bool shouldNext,
  }) {
    final userId = shouldNext ? currentUserId + 1 : currentUserId - 1;
    DetailRoute(userId: userId).replace(context);
  }
}
