import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/page/reduce_waste/constant/reduce_waste_selection_option.dart';

final selectedReduceAmountProvider =
    StateProvider<ReduceWasteSelectionOption>((ref) {
  return ReduceWasteSelectionOption.none;
});
