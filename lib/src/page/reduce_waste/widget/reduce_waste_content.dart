import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/page/reduce_waste/constant/reduce_waste_selection_option.dart';
import 'package:yuv_quiz/src/page/reduce_waste/widget/reduce_estimate_result.dart';
import 'package:yuv_quiz/src/page/reduce_waste/widget/reduce_waste_action_row.dart';
import 'package:yuv_quiz/src/page/reduce_waste/widget/reduce_waste_selection.dart';

class ReduceWasteContent extends HookConsumerWidget {
  const ReduceWasteContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // get total weight by using provider
    // final originalTotalWeight = ref.watch(originalTotalWeightProvider);
    const originalTotalWeight = 60.0;
    final selectedOption = useState(ReduceWasteSelectionOption.none);

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
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.only(
            left: 32.0,
            right: 32.0,
            bottom: 26.0,
          ),
          child: ReduceWasteActionRow(),
        ),
      ],
    );
  }
}
