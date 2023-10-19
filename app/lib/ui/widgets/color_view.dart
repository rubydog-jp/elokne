import 'package:flutter/material.dart';
import 'package:app/core/types/color.dart' as core;

class ColorView extends StatelessWidget {
  const ColorView({
    super.key,
    required this.color,
  });

  final core.Color color;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: switch (color) {
        core.Color.skin => const Color(0xFFFCE2C4),
        core.Color.skinShadow => const Color(0xFFFCCD97),
        core.Color.bodyLine => const Color(0xFF202020),
      },
    );
  }
}
