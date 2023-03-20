import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/page/reduce_waste/constant/reduce_waste_selection_option.dart';
import 'package:yuv_quiz/src/page/reduce_waste/widget/reduce_estimate_result_item.dart';
import 'package:yuv_quiz/src/shared/theme/theme_color.dart';

class ReduceEstimateResult extends HookConsumerWidget {
  final double originalTotalWeight;
  final ReduceWasteSelectionOption selectedOption;

  const ReduceEstimateResult({
    super.key,
    required this.originalTotalWeight,
    required this.selectedOption,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        EstimateResultItem(
          hints: 'Last dispensed',
          totalWeight: originalTotalWeight,
          colorWeight: 30.0,
          developerWeight: 30.0,
        ),
        if (selectedOption != ReduceWasteSelectionOption.none)
          EstimateResultItem(
            hints: 'New Total',
            totalWeightTextColor: ThemeColor.adjustedColor,
            totalWeight:
                originalTotalWeight - selectedOption.selectedReduceAmount,
            colorWeight:
                (originalTotalWeight - selectedOption.selectedReduceAmount) / 2,
            developerWeight:
                (originalTotalWeight - selectedOption.selectedReduceAmount) / 2,
          ),
      ],
    );
  }
}
