import 'package:app/core/features/create_new_board.dart';
import 'package:app/core/features/create_new_palette.dart';
import 'package:app/runner/notifiers/board.dart';
import 'package:app/runner/notifiers/palette.dart';

class RefreshUsecase {
  const RefreshUsecase(
    this.boardNotifier,
    this.paletteNotifier,
  );

  final BoardNotifier boardNotifier;
  final PaletteNotifier paletteNotifier;

  void run() {
    // core を呼び出し
    final newBoard = createNewBoard();
    final newPalette = createNewPalette();

    // ボードを更新
    boardNotifier.update(newBoard);

    // パレットを更新
    paletteNotifier.update(newPalette);
  }
}
