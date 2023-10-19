import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/core/types/palette.dart';
import 'package:app/runner/notifiers/palette.dart';

/// Palette
final paletteProvider = NotifierProvider<PaletteNotifier, Palette>(
  () => PaletteNotifier(),
);
