import 'package:app/core/config/config.dart';
import 'package:app/core/types/ink.dart';
import 'package:app/core/types/palette.dart';
import 'package:app/core/types/color.dart';

Palette createNewPalette() {
  return const Palette(
    inks: [
      Ink(
        color: Color.skinShadow,
        amount: inkAmountSkinShadow,
      ),
      Ink(
        color: Color.bodyLine,
        amount: inkAmountBodyLine,
      ),
    ],
    selectedColor: Color.bodyLine,
  );
}
