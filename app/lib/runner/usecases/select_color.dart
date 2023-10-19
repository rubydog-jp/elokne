import 'package:app/core/types/color.dart';
import 'package:app/core/types/palette.dart';
import 'package:app/core/features/select_color.dart';
import 'package:app/runner/notifiers/palette.dart';

class SelectColorUsecase {
  const SelectColorUsecase(
    this.palette,
    this.paletteNotifier,
  );

  final Palette palette;
  final PaletteNotifier paletteNotifier;

  void run(Color color) {
    // core を呼び出し
    final newState = selectColor(palette, color);

    // パレットを更新
    paletteNotifier.update(newState);
  }
}
