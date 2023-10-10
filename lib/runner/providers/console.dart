import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/runner/interfaces/console.dart';
import 'package:app/runner/providers/flavor.dart';
import 'package:app/runner/types/flavor.dart';
import 'package:app/api/console/dev_console.dart';
import 'package:app/api/console/prd_console.dart';

/// Console
final consoleProvider = Provider<Console>(
  (ref) {
    final flavor = ref.watch(flavorProvider);
    return switch (flavor) {
      Flavor.dev => DevConsole(),
      Flavor.prd => PrdConsole(),
    };
  },
);
