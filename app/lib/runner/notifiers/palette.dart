import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/core/features/create_new_palette.dart';
import 'package:app/core/types/palette.dart';

/// パレットの状態を管理
class PaletteNotifier extends Notifier<Palette> {
  /// 初期化
  @override
  Palette build() {
    return createNewPalette();
  }

  /// 更新
  void update(Palette newPalette) {
    state = newPalette;
  }
}
