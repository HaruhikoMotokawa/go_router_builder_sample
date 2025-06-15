part of '../app_router.dart';

/// パスが見つからなかった場合のエラーページ
///
/// 例）DeepLink経由でのパスが見つからなかった場合など
class _ErrorPage extends HookWidget {
  const _ErrorPage();

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          final isBackHome = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Error'),
                content: const Text('Page not found'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
          if (isBackHome != null && isBackHome && context.mounted) {
            const HomeRoute().go(context);
          }
        });
        return null;
      },
      [],
    );
    return const Scaffold(
      body: SizedBox.shrink(),
    );
  }
}
