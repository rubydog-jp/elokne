import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/core/types/board.dart';
import 'package:app/runner/notifiers/board.dart';

final boardProvider = NotifierProvider<BoardNotifier, Board>(
  () => BoardNotifier(),
);
