import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/runner/providers/palette.dart';
import 'package:app/runner/usecases/select_color.dart';

/// Usecase for Select Color
final selectColorUsecaseProvider = Provider<SelectColorUsecase>(
  (ref) {
    final palette = ref.watch(paletteProvider);
    final paletteNotif = ref.watch(paletteProvider.notifier);

    return SelectColorUsecase(
      palette,
      paletteNotif,
    );
  },
);
