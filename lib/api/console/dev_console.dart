import 'package:app/runner/interfaces/console.dart';
import 'package:flutter/material.dart';

/// 開発モード用のコンソール
class DevConsole implements Console {
  @override
  void log(String text) {
    debugPrint('app: $text');
  }
}
