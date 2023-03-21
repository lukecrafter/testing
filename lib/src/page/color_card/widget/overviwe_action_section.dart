import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/shared/widget/action_button.dart';

class OverviewActionSection extends HookConsumerWidget {
  const OverviewActionSection({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // disable color

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: ActionButton(
            text: 'Print Label',
            borderColor: const Color(0xFF707070).withOpacity(0.39),
            backgroundColor: Colors.white,
            textColor: Colors.black.withOpacity(0.39),
            padding: const EdgeInsets.symmetric(vertical: 26.8),
            onPressed: () {},
          ),
        ),
        const SizedBox(
          width: 27.0,
        ),
        Expanded(
          child: ActionButton(
            text: 'Dispense',
            borderColor: Colors.black.withOpacity(0.32),
            backgroundColor: Colors.black.withOpacity(0.32),
            textColor: Colors.white.withOpacity(0.32),
            padding: const EdgeInsets.symmetric(vertical: 26.8),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
