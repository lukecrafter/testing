import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OverviewContent extends HookConsumerWidget {
  const OverviewContent({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // TODO: Content
        Flexible(
          child: Center(
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
