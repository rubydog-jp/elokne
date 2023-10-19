import 'package:app/core/types/color.dart';

class Ink {
  const Ink({
    required this.color,
    required this.amount,
  });

  final Color color;
  final int amount;

  bool get hasAmount {
    return amount > 0;
  }

  Ink copyWith({int? amount}) {
    return Ink(
      color: color,
      amount: amount ?? this.amount,
    );
  }

  @override
  String toString() => '($color, $amount)';

  factory Ink.fromJson(Map<String, dynamic> json) {
    return Ink(
      color: json['color'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'amount': amount,
    };
  }
}
