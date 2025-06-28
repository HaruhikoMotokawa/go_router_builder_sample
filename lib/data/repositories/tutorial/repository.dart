import 'dart:async';

class TutorialRepository {
  /// アプリのチュートリアルを確認したかのストリーム
  Stream<bool> get isTutorialChecked => _tutorialCheckedController.stream;

  final StreamController<bool> _tutorialCheckedController =
      StreamController<bool>();

  void init() {
    // 初期はチュートリアル未確認
    _tutorialCheckedController.sink.add(false);
  }

  void checked() {
    // チュートリアル確認が完了
    _tutorialCheckedController.sink.add(true);
  }
}
