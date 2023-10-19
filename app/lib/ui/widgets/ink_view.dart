import 'package:flutter/material.dart';
import 'package:app/core/types/ink.dart' as core;
import 'package:app/ui/theme/text_style.dart';
import 'package:app/ui/widgets/color_view.dart';

class InkView extends StatelessWidget {
  const InkView({
    super.key,
    required this.ink,
    required this.isSelected,
    required this.onPressed,
  });

  final core.Ink ink;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: isSelected ? Colors.green : Colors.white,
          ),
        ),
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: SizedBox(
                width: 20,
                height: 20,
                child: ColorView(color: ink.color),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              width: 40,
              alignment: Alignment.centerRight,
              child: Text(
                '${ink.amount}',
                style: TextStyles.dot,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
