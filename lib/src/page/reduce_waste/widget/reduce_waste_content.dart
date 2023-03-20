import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/page/reduce_waste/constant/reduce_waste_selection_option.dart';
import 'package:yuv_quiz/src/page/reduce_waste/widget/reduce_estimate_result.dart';
import 'package:yuv_quiz/src/page/reduce_waste/widget/reduce_waste_action_row.dart';
import 'package:yuv_quiz/src/page/reduce_waste/widget/reduce_waste_selection.dart';

class ReduceWasteContent extends HookConsumerWidget {
  final ReduceWasteSelectionOption initialState;

  const ReduceWasteContent({
    super.key,
    required this.initialState,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // get total weight by using provider
    // final originalTotalWeight = ref.watch(originalTotalWeightProvider);
    const originalTotalWeight = 60.0;

    final selectedOption = useState(initialState);

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
        ReduceEstimateResult(
          originalTotalWeight: originalTotalWeight,
          selectedOption: selectedOption.value,
        ),
        const SizedBox(
          height: 56.8,
        ),
        ReduceWasteSelection(
          selectedOption: selectedOption.value,
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
          ),
        ),
      ],
    );
  }
}
