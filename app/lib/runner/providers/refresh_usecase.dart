import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/runner/providers/board.dart';
import 'package:app/runner/providers/palette.dart';
import 'package:app/runner/usecases/refresh.dart';

/// Usecase for Refresh
final refreshUsecaseProvider = Provider<RefreshUsecase>(
  (ref) {
    final boardNotif = ref.watch(boardProvider.notifier);
    final paletteNotif = ref.watch(paletteProvider.notifier);

    return RefreshUsecase(
      boardNotif,
      paletteNotif,
    );
  },
);
