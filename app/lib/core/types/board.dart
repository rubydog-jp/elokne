import 'package:app/core/types/dot.dart';

class Board {
  const Board({
    required this.dotCountX,
    required this.dotCountY,
    required this.dots,
  });

  final int dotCountX;
  final int dotCountY;
  final List<Dot> dots;

  Board copyWith({
    int? dotCountX,
    int? dotCountY,
    List<Dot>? dots,
  }) {
    return Board(
      dotCountX: dotCountX ?? this.dotCountX,
      dotCountY: dotCountY ?? this.dotCountY,
      dots: dots ?? this.dots,
    );
  }

  factory Board.fromJson(Map<String, dynamic> json) {
    return Board(
      dotCountX: json['dotCountX'],
      dotCountY: json['dotCountY'],
      dots: List<Dot>.from(
        json['dots'].map((it) => Dot.fromJson(it)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'dotCountX': dotCountX,
        'dotCountY': dotCountY,
        'dots': List<dynamic>.from(dots.map((it) => it.toJson())),
      };
}
