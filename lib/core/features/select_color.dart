import 'package:app/core/types/color.dart';
import 'package:app/core/types/palette.dart';

Palette selectColor(
  Palette oldPalette,
  Color newColor,
) {
  return oldPalette.copyWith(selectedColor: newColor);
}
