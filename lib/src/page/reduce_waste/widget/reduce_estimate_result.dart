import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/page/reduce_waste/constant/reduce_waste_data_type.dart';
import 'package:yuv_quiz/src/page/reduce_waste/constant/reduce_waste_selection_option.dart';
import 'package:yuv_quiz/src/page/reduce_waste/helper/reduce_waste_helper.dart';
import 'package:yuv_quiz/src/page/reduce_waste/widget/reduce_estimate_new_result_item.dart';
import 'package:yuv_quiz/src/page/reduce_waste/widget/reduce_estimate_result_item.dart';
import 'package:yuv_quiz/src/page/reduce_waste/widget/reduce_estimate_weight_result_item.dart';

class ReduceEstimateResult extends HookConsumerWidget {
  final double originalTotalWeight;
  final double? weightResult;
  final double? remainingWeight;
  final ReduceWasteSelectionOption selectedOption;

  const ReduceEstimateResult({
    super.key,
    required this.originalTotalWeight,
    this.weightResult,
    required this.remainingWeight,
    required this.selectedOption,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List itemList = useMemoized(() {
      final List<ReduceWasteDataType> list = [ReduceWasteDataType.dispensed];
      if (weightResult != null) {
        list.add(ReduceWasteDataType.used);
      }
      if (selectedOption != ReduceWasteSelectionOption.none) {
        list.add(ReduceWasteDataType.estimated);
      }
      return list;
    }, [weightResult, selectedOption]);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (final item in itemList) ...[
          if (item == ReduceWasteDataType.dispensed)
            EstimateResultItem(
              hints: 'Last dispensed',
              totalWeight: originalTotalWeight,
              description: ReduceWasteHelper.getEstimateResultDescription(
                ReduceWasteDataType.dispensed,
                colorWeight: originalTotalWeight / 2,
                developerWeight: originalTotalWeight / 2,
              ),
            ),
          if (item == ReduceWasteDataType.used)
            ReduceEstimateWeightResultItem(
              originalTotalWeight: originalTotalWeight,
              weighResult: weightResult!,
              remainingWeight: remainingWeight,
            ),
          if (item == ReduceWasteDataType.estimated)
            ReduceEstimateNewResultItem(
              originalTotalWeight: originalTotalWeight,
              selectedOption: selectedOption,
            )
        ]
      ],
    );
  }
}
