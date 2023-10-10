import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/runner/providers/palette.dart';
import 'package:app/runner/providers/refresh_usecase.dart';
import 'package:app/runner/providers/select_color_usecase.dart';
import 'package:app/ui/widgets/ink_view.dart';
import 'package:app/ui/widgets/board_view.dart';
import 'package:app/ui/widgets/refresh_button.dart';

/// ホーム画面
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = ref.watch(paletteProvider);
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RefreshButton(
                  onPressed: () {
                    final usecase = ref.read(refreshUsecaseProvider);
                    usecase.run();
                  },
                ),
                ...palette.inks.map(
                  (ink) {
                    return InkView(
                      ink: ink,
                      isSelected: palette.selectedColor == ink.color,
                      onPressed: () {
                        final usecase = ref.read(selectColorUsecaseProvider);
                        usecase.run(ink.color);
                      },
                    );
                  },
                ).toList(),
              ],
            ),
            const BoardView(),
          ],
        ),
      ),
    );
  }
}
