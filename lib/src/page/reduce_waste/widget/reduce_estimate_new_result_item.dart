import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/page/reduce_waste/constant/reduce_waste_data_type.dart';
import 'package:yuv_quiz/src/page/reduce_waste/constant/reduce_waste_selection_option.dart';
import 'package:yuv_quiz/src/page/reduce_waste/helper/reduce_waste_helper.dart';
import 'package:yuv_quiz/src/page/reduce_waste/widget/reduce_estimate_result_item.dart';
import 'package:yuv_quiz/src/shared/theme/theme_color.dart';

class ReduceEstimateNewResultItem extends HookConsumerWidget {
  final double originalTotalWeight;
  final ReduceWasteSelectionOption selectedOption;

  const ReduceEstimateNewResultItem({
    super.key,
    required this.originalTotalWeight,
    required this.selectedOption,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newTotal = useMemoized(() {
      return originalTotalWeight - selectedOption.selectedReduceAmount;
    }, [selectedOption]);

    return EstimateResultItem(
      hints: 'New Total',
      bodyTextColor: ThemeColor.adjustedColor,
      totalWeight: newTotal,
      description: ReduceWasteHelper.getEstimateResultDescription(
        ReduceWasteDataType.estimated,
        colorWeight: newTotal / 2,
        developerWeight: newTotal / 2,
      ),
    );
  }
}
