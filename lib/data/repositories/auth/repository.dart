import 'dart:async';

class AuthRepository {
  AuthRepository();

  /// ログイン状態を管理するためのストリーム。
  Stream<bool> get isLoggedIn => _authStateController.stream;

  final StreamController<bool> _authStateController = StreamController<bool>();

  void init() {
    // 初期は未ログイン
    _authStateController.sink.add(false);
  }

  Future<void> login() async {
    // ログイン処理色々
    // ...

    Future<void>.delayed(const Duration(milliseconds: 300), () {
      // ログイン成功したら
      _authStateController.sink.add(true);
    });
  }

  Future<void> logout() async {
    // ログアウト処理色々
    // ...

    Future<void>.delayed(const Duration(milliseconds: 300), () {
      // ログアウト成功したら
      _authStateController.sink.add(false);
    });
  }
}
