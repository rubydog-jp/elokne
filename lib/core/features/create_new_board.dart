import 'package:app/core/config/config.dart';
import 'package:app/core/types/board.dart';
import 'package:app/core/types/dot.dart';

Board createNewBoard() {
  final List<Dot> dots = [];
  final rangeX = List.generate(dotCountX, (i) => i);
  final rangeY = List.generate(dotCountY, (i) => i);

  for (final x in rangeX) {
    for (final y in rangeY) {
      final id = '($x,$y)';
      final dot = Dot(id: id);
      dots.add(dot);
    }
  }

  return Board(
    dotCountX: dotCountX,
    dotCountY: dotCountY,
    dots: dots,
  );
}
