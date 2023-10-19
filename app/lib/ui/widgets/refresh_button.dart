import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RefreshButton extends ConsumerWidget {
  const RefreshButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
