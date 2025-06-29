import 'dart:async';

class MaintenanceRepository {
  MaintenanceRepository();

  /// メンテナンス中かどうかを取得するメソッド
  Stream<bool> get isMaintenanceMode => _maintenanceModeController.stream;

  final _maintenanceModeController = StreamController<bool>();

  /// メンテナンス状態を初期化するメソッド
  void init() {
    // 初期状態はメンテナンスモードではない
    _maintenanceModeController.sink.add(false);
  }

  /// メンテナンス状態を設定するメソッド
  Future<void> setMaintenanceMode() async {
    _maintenanceModeController.sink.add(true);

    // ５秒後にメンテナンスモードを解除する例
    await Future<void>.delayed(const Duration(seconds: 5), () {
      _maintenanceModeController.sink.add(false);
    });
  }
}
