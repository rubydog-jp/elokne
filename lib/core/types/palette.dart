import 'package:app/core/types/ink.dart';
import 'package:app/core/types/color.dart';

class Palette {
  const Palette({
    required this.inks,
    required this.selectedColor,
  });

  final List<Ink> inks;
  final Color selectedColor;

  Ink get selectedInk {
    return inks.firstWhere((it) => it.color == selectedColor);
  }

  @override
  String toString() => 'Palette(selected: $selectedColor)';

  Palette copyWith({
    List<Ink>? inks,
    Color? selectedColor,
  }) {
    return Palette(
      inks: inks ?? this.inks,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }

  factory Palette.fromJson(Map<String, dynamic> json) {
    return Palette(
      inks: List<Ink>.from(
        json['inks'].map((it) => Ink.fromJson(it)),
      ),
      selectedColor: json['selectedColor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'inks': List<dynamic>.from(inks.map((it) => it.toJson())),
      'selected': selectedColor,
    };
  }
}
