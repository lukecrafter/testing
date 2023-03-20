import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/page/reduce_waste/constant/reduce_waste_selection_option.dart';
import 'package:yuv_quiz/src/shared/widget/filter_selection_button.dart';

class ReduceWasteSelection extends HookConsumerWidget {
  final ReduceWasteSelectionOption selectedOption;

  const ReduceWasteSelection({
    super.key,
    required this.selectedOption,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 79.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (final option in ReduceWasteSelectionOption.values) ...[
            FilterSelectionButton(
              onPressed: () {},
              isSelected: selectedOption == option,
              text: option.selectedReduceAmountString,
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 11.0),
            ),
          ]
        ],
      ),
    );
  }
}
