import 'package:app/runner/interfaces/console.dart';

/// 本番モード用のコンソール
class PrdConsole implements Console {
  @override
  void log(String text) {
    // ログは出さない
  }
}
