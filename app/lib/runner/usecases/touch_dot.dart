import 'package:app/core/types/board.dart';
import 'package:app/core/types/dot.dart';
import 'package:app/core/types/palette.dart';
import 'package:app/core/features/paint_dot.dart' as core;
import 'package:app/runner/notifiers/board.dart';
import 'package:app/runner/notifiers/palette.dart';

class TouchDotUsecase {
  const TouchDotUsecase(
    this.board,
    this.palette,
    this.boardNotifier,
    this.paletteNotifier,
  );

  final Board board;
  final Palette palette;
  final BoardNotifier boardNotifier;
  final PaletteNotifier paletteNotifier;

  void run(Dot dot) {
    // core を呼び出し
    final newState = core.paintDot(board, palette, dot);

    // ボードを更新
    boardNotifier.update(newState.$1);

    // パレットを更新
    paletteNotifier.update(newState.$2);
  }
}
