import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/runner/providers/board.dart';
import 'package:app/runner/providers/palette.dart';
import 'package:app/runner/usecases/touch_dot.dart';

/// Usecase for Touch Dot
final touchDotUsecaseProvider = Provider<TouchDotUsecase>(
  (ref) {
    final board = ref.watch(boardProvider);
    final palette = ref.watch(paletteProvider);
    final boardNotif = ref.watch(boardProvider.notifier);
    final paletteNotif = ref.watch(paletteProvider.notifier);

    return TouchDotUsecase(
      board,
      palette,
      boardNotif,
      paletteNotif,
    );
  },
);
