import 'package:app/core/types/color.dart';

class Dot {
  const Dot({
    required this.id,
    this.color = Color.skin,
  });

  final String id;
  final Color color;

  @override
  String toString() => '($id)';

  Dot copyWith({Color? color}) {
    return Dot(
      id: id,
      color: color ?? this.color,
    );
  }

  factory Dot.fromJson(Map<String, dynamic> json) {
    return Dot(
      id: json['id'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': color,
      'color': color,
    };
  }
}
