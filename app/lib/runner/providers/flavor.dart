import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/runner/types/flavor.dart';

/// Flavor
final flavorProvider = Provider(
  (ref) {
    const rawString = String.fromEnvironment('FLAVOR');
    return switch (rawString) {
      'dev' => Flavor.dev,
      'prd' => Flavor.prd,
      String() => Flavor.dev,
    };
  },
);
