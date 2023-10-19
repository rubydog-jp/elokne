import 'package:app/core/types/board.dart';
import 'package:app/core/types/palette.dart';
import 'package:app/core/types/dot.dart';
import 'package:app/core/types/color.dart';

(Board, Palette) paintDot(
  Board oldBoard,
  Palette oldPalette,
  Dot oldDot,
) {
  if (!oldPalette.selectedInk.hasAmount) {
    // out of ink
    return (oldBoard, oldPalette);
  }

  if (oldDot.color != Color.skin) {
    // already colored this dot
    return (oldBoard, oldPalette);
  }

  // use ink
  final color = oldPalette.selectedColor;
  final oldInk = oldPalette.selectedInk;
  final newInk = oldInk.copyWith(
    amount: oldInk.amount - 1,
  );
  final newInks = List.of(oldPalette.inks);
  final inkIndex = oldPalette.inks.indexWhere(
    (it) => it.color == color,
  );
  newInks[inkIndex] = newInk;
  final newPalette = oldPalette.copyWith(inks: newInks);

  // paint dot
  final newDots = List.of(oldBoard.dots);
  final newDot = oldDot.copyWith(color: color);
  final dotIndex = oldBoard.dots.indexWhere(
    (it) => it.id == oldDot.id,
  );
  newDots[dotIndex] = newDot;
  final newBoard = oldBoard.copyWith(dots: newDots);

  return (newBoard, newPalette);
}
