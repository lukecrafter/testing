enum ReduceWasteSelectionOption {
  none,
  five,
  ten,
  fifteen,
}

final reduceWasteSelectionOptionValueMap = {
  ReduceWasteSelectionOption.none: 0.0,
  ReduceWasteSelectionOption.five: 5.0,
  ReduceWasteSelectionOption.ten: 10.0,
  ReduceWasteSelectionOption.fifteen: 15.0,
};

ReduceWasteSelectionOption fromReduceAmountToReduceWasteSelectionOption(
    num value) {
  return reduceWasteSelectionOptionValueMap.entries
      .firstWhere((element) => element.value == value,
          orElse: () => const MapEntry(ReduceWasteSelectionOption.none, 0.0))
      .key;
}

extension ReduceWasteSelectionOptionEX on ReduceWasteSelectionOption {
  get selectedReduceAmount {
    switch (this) {
      case ReduceWasteSelectionOption.none:
        return reduceWasteSelectionOptionValueMap[
            ReduceWasteSelectionOption.none];
      case ReduceWasteSelectionOption.five:
        return reduceWasteSelectionOptionValueMap[
            ReduceWasteSelectionOption.five];
      case ReduceWasteSelectionOption.ten:
        return reduceWasteSelectionOptionValueMap[
            ReduceWasteSelectionOption.ten];
      case ReduceWasteSelectionOption.fifteen:
        return reduceWasteSelectionOptionValueMap[
            ReduceWasteSelectionOption.fifteen];
    }
  }

  get selectedReduceAmountString {
    switch (this) {
      case ReduceWasteSelectionOption.none:
        return 'No Change';
      case ReduceWasteSelectionOption.five:
        return '5g less';
      case ReduceWasteSelectionOption.ten:
        return '10g less';
      case ReduceWasteSelectionOption.fifteen:
        return '15g less';
    }
  }

  String description(double originalTotalWeight) {
    final colorWeight = (originalTotalWeight - selectedReduceAmount) / 2;
    final developerWeight = (originalTotalWeight - selectedReduceAmount) / 2;

    return '(${colorWeight.toStringAsFixed(0)}g C + ${developerWeight.toStringAsFixed(0)}g D)';
  }
}
