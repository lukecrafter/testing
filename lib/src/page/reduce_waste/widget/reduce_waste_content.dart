import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/domain/reduce_waste/mock/mock_data.dart';
import 'package:yuv_quiz/src/domain/reduce_waste/store/reduce_waste_provider.dart';
import 'package:yuv_quiz/src/page/reduce_waste/constant/reduce_waste_selection_option.dart';
import 'package:yuv_quiz/src/page/reduce_waste/widget/reduce_estimate_result.dart';
import 'package:yuv_quiz/src/page/reduce_waste/widget/reduce_waste_action_row.dart';
import 'package:yuv_quiz/src/page/reduce_waste/widget/reduce_waste_selection.dart';

class ReduceWasteContent extends HookConsumerWidget {
  const ReduceWasteContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedOption = useState(ref.watch(selectedReduceAmountProvider));

    final weighResult = useState<double?>(null);

    final remainingWeight = useMemoized(() {
      return weighResult.value != null
          ? mockOriginalTotalWeight - (weighResult.value ?? 0)
          : null;
    }, [weighResult.value]);

    final weighBowlOnPressed = useCallback(() {
      weighResult.value =
          (Random().nextDouble() * mockOriginalTotalWeight / 2) +
              mockOriginalTotalWeight / 2;

      selectedOption.value = ReduceWasteSelectionOption.none;
    }, []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 66.0,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Reduce Waste',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 50.0,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 48.0,
        ),
        SizedBox(
          height: 195.0,
          child: ReduceEstimateResult(
            originalTotalWeight: mockOriginalTotalWeight,
            weightResult: weighResult.value,
            remainingWeight: remainingWeight,
            selectedOption: selectedOption.value,
          ),
        ),
        const SizedBox(
          height: 56.8,
        ),
        ReduceWasteSelection(
          selectedOption: selectedOption.value,
          remainingWeight: remainingWeight,
          onOptionSelected: (option) {
            selectedOption.value = option;
          },
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(
            left: 32.0,
            right: 32.0,
            bottom: 26.0,
          ),
          child: ReduceWasteActionRow(
            selectedOption: selectedOption.value,
            weighResult: weighResult.value,
            leftButtonOnPressed: weighBowlOnPressed,
          ),
        ),
      ],
    );
  }
}
