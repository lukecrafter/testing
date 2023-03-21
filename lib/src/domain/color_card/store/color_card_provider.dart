import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/domain/reduce_waste/mock/mock_data.dart';
import 'package:yuv_quiz/src/domain/reduce_waste/store/reduce_waste_provider.dart';
import 'package:yuv_quiz/src/page/reduce_waste/constant/reduce_waste_selection_option.dart';

final colourWeightProvider = Provider((ref) {
  const originalWeight = mockOriginalTotalWeight;
  final selectedReduceAmount = ref.watch(selectedReduceAmountProvider);
  if (selectedReduceAmount != ReduceWasteSelectionOption.none) {
    return originalWeight - selectedReduceAmount.selectedReduceAmount;
  }
  return originalWeight;
});
