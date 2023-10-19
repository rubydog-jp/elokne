import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/core/features/create_new_board.dart';
import 'package:app/core/types/board.dart';

/// ボードの状態を管理
class BoardNotifier extends Notifier<Board> {
  /// 初期化
  @override
  Board build() {
    return createNewBoard();
  }

  /// 更新
  void update(Board newBoard) {
    state = newBoard;
  }
}
