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
          child: Container(),
        )
      ],
    );
  }
}
