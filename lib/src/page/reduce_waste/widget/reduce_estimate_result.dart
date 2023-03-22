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
    final key = useMemoized(() => GlobalKey<SliverAnimatedListState>(), []);
    final itemList = useState([
      ReduceWasteDataType.dispensed,
      if (selectedOption != ReduceWasteSelectionOption.none)
        ReduceWasteDataType.estimated
    ]);

    final dispensedItem = useMemoized(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: EstimateResultItem(
          key: const ValueKey('dispensedItem'),
          hints: 'Last dispensed',
          totalWeight: originalTotalWeight,
          description: ReduceWasteHelper.getEstimateResultDescription(
            ReduceWasteDataType.dispensed,
            colorWeight: originalTotalWeight / 2,
            developerWeight: originalTotalWeight / 2,
          ),
        ),
      ),
      [originalTotalWeight],
    );

    final usedItem = useMemoized(
      () => Padding(
        key: const ValueKey('usedItemPadding'),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ReduceEstimateWeightResultItem(
          key: const ValueKey('usedItem'),
          originalTotalWeight: originalTotalWeight,
          weighResult: weightResult ?? 0.0,
          remainingWeight: remainingWeight,
        ),
      ),
      [originalTotalWeight, weightResult, remainingWeight],
    );

    final estimatedItem = useMemoized(
        () => Padding(
              key: const ValueKey('estimatedItemPadding'),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ReduceEstimateNewResultItem(
                key: const ValueKey('estimatedItem'),
                originalTotalWeight: originalTotalWeight,
                selectedOption: selectedOption,
              ),
            ),
        [originalTotalWeight, selectedOption]);

    final isUpdated = useState(false);
    final isRemoved = useState(false);
    final isInserted = useState(false);

    useEffect(() {
      final currentList = [...itemList.value];
      final List<ReduceWasteDataType> list = [ReduceWasteDataType.dispensed];
      if (weightResult != null) {
        list.add(ReduceWasteDataType.used);
      }
      if (selectedOption != ReduceWasteSelectionOption.none) {
        list.add(ReduceWasteDataType.estimated);
      }

      isUpdated.value = currentList.length == list.length &&
          currentList.every((element) => list.contains(element));
      isRemoved.value = currentList.length > list.length;
      isInserted.value = currentList.length < list.length;
      itemList.value = list;

      if (isInserted.value) {
        key.currentState?.insertItem(
          list.length - 1,
          duration: const Duration(milliseconds: 500),
        );
      } else if (isRemoved.value) {
        final item = currentList.last;
        Widget? child;

        if (item == ReduceWasteDataType.dispensed) {
          child = dispensedItem;
        }
        if (item == ReduceWasteDataType.used) {
          child = usedItem;
        }
        if (item == ReduceWasteDataType.estimated) {
          child = estimatedItem;
        }

        key.currentState?.removeItem(
          currentList.length - 1,
          (context, animation) => SizeTransition(
            sizeFactor: animation,
            axis: Axis.horizontal,
            axisAlignment: -1,
            child: child,
          ),
        );
      }

      return;
    }, [weightResult, selectedOption]);

    return Center(
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        slivers: [
          SliverAnimatedList(
            key: key,
            initialItemCount: itemList.value.length,
            itemBuilder: (context, index, animation) {
              final item = itemList.value[index];
              Widget? child;

              if (item == ReduceWasteDataType.dispensed) {
                child = dispensedItem;
              }
              if (item == ReduceWasteDataType.used) {
                child = usedItem;
              }
              if (item == ReduceWasteDataType.estimated) {
                child = estimatedItem;
              }

              return SizeTransition(
                sizeFactor: animation,
                axis: Axis.horizontal,
                axisAlignment: -1,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: child,
                ),
              );
            },
          ),
        ],
      ),
    );

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
