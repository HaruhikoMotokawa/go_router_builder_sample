import 'dart:async';

class AuthRepository {
  AuthRepository();

  /// ログイン状態を管理するためのストリーム。
  Stream<bool> get isLoggedIn => _authStateController.stream;

  /// アプリのチュートリアルを確認したかのストリーム
  Stream<bool> get isTutorialChecked => _tutorialCheckedController.stream;

  final StreamController<bool> _authStateController = StreamController<bool>();

  final StreamController<bool> _tutorialCheckedController =
      StreamController<bool>();

  void init() {
    // 初期化が完了したら、初期状態を設定
    _authStateController.sink.add(false); // 初期は未ログイン
    _tutorialCheckedController.sink.add(false); // 初期はチュートリアル未確認
  }

  Future<void> login() async {
    // ログイン処理色々
    Future<void>.delayed(const Duration(milliseconds: 300), () {
      // ログイン成功したら
      _authStateController.sink.add(true);
    });
  }

  Future<void> logout() async {
    // Implement sign-out logic here
    Future<void>.delayed(const Duration(milliseconds: 300), () {
      // ログアウト成功したら
      _authStateController.sink.add(false);
    });
  }

  void checkTutorial() {
    // チュートリアル確認が完了したら
    _tutorialCheckedController.sink.add(true);
  }
}
