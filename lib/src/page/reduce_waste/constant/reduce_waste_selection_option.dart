enum ReduceWasteSelectionOption {
  none,
  five,
  ten,
  fifteen,
}

extension ReduceWasteSelectionOptionEX on ReduceWasteSelectionOption {
  get selectedReduceAmount {
    switch (this) {
      case ReduceWasteSelectionOption.none:
        return 0.0;
      case ReduceWasteSelectionOption.five:
        return 5.0;
      case ReduceWasteSelectionOption.ten:
        return 10.0;
      case ReduceWasteSelectionOption.fifteen:
        return 15.0;
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
}
