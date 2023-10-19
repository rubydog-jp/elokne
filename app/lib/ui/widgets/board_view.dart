import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/runner/providers/board.dart';
import 'package:app/runner/providers/touch_dot_usecase.dart';
import 'package:app/ui/widgets/swipe_touch.dart';
import 'package:app/ui/widgets/color_view.dart';

class BoardView extends ConsumerWidget {
  const BoardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final board = ref.watch(boardProvider);

    /// なぞる操作に反応するドットたち
    final dots = board.dots.map((it) {
      return SwipeTouchItem(
        id: it.id,
        child: ColorView(color: it.color),
      );
    });

    return AspectRatio(
      aspectRatio: 1,
      // なぞる操作を受け付ける範囲
      child: SwipeTouchDetector(
        onTouch: (id) {
          final dot = board.dots.firstWhere((it) => id == it.id);
          final usecase = ref.read(touchDotUsecaseProvider);
          usecase.run(dot);
        },
        // ドットの外側からなぞり始められるよう余白を作る
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
          padding: const EdgeInsets.all(10),
          // ドットたちを並べる
          child: GridView.count(
            crossAxisCount: board.dotCountX,
            physics: const NeverScrollableScrollPhysics(),
            children: dots.toList(),
          ),
        ),
      ),
    );
  }
}
