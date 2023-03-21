import 'package:yuv_quiz/src/page/reduce_waste/constant/reduce_waste_data_type.dart';
import 'package:yuv_quiz/src/page/reduce_waste/constant/reduce_waste_selection_option.dart';

class ReduceWasteHelper {
  static String getEstimateResultDescription(
    ReduceWasteDataType dataType, {
    double? colorWeight,
    double? developerWeight,
    double? remainingWeight,
  }) {
    assert(((dataType == ReduceWasteDataType.dispensed ||
                dataType == ReduceWasteDataType.estimated) &&
            colorWeight != null &&
            developerWeight != null) ||
        (dataType == ReduceWasteDataType.used && remainingWeight != null));

    if (dataType == ReduceWasteDataType.dispensed ||
        dataType == ReduceWasteDataType.estimated) {
      return '(${colorWeight!.toStringAsFixed(0)}g C + ${developerWeight!.toStringAsFixed(0)}g D)';
    } else {
      return '${remainingWeight!.toStringAsFixed(0)}g left in the bowl';
    }
  }

  static List<num> getSelectedReduceAmountList() {
    List<num> list = [];
    for (final option in ReduceWasteSelectionOption.values) {
      list.add(option.selectedReduceAmount);
    }
    return list;
  }

  static ReduceWasteSelectionOption? isShowRecommendTag({
    required double remainingWeight,
  }) {
    num? smallestDifference;
    num? reducedAmount;

    List<num> list = getSelectedReduceAmountList();

    for (num value in list) {
      // TODO: round up or down?
      if (value <= remainingWeight.round()) {
        num difference = (remainingWeight - value).round();
        if (smallestDifference == null || difference <= smallestDifference) {
          smallestDifference = difference;
          reducedAmount = value;
        }
      }
    }

    if (reducedAmount != null) {
      return fromReduceAmountToReduceWasteSelectionOption(reducedAmount);
    } else {
      return null;
    }
  }
}
