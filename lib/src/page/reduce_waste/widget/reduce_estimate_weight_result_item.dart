import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/page/reduce_waste/constant/reduce_waste_data_type.dart';
import 'package:yuv_quiz/src/page/reduce_waste/helper/reduce_waste_helper.dart';
import 'package:yuv_quiz/src/page/reduce_waste/widget/reduce_estimate_result_item.dart';

class ReduceEstimateWeightResultItem extends HookConsumerWidget {
  final double originalTotalWeight;
  final double weighResult;
  final double? remainingWeight;

  const ReduceEstimateWeightResultItem({
    super.key,
    required this.originalTotalWeight,
    required this.weighResult,
    required this.remainingWeight,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return EstimateResultItem(
      hints: 'Used on client',
      bodyTextColor: Colors.white,
      totalWeight: weighResult,
      backgroundColor: Colors.black,
      descriptionColor: Colors.white,
      description: ReduceWasteHelper.getEstimateResultDescription(
        ReduceWasteDataType.used,
        remainingWeight: remainingWeight,
      ),
    );
  }
}
