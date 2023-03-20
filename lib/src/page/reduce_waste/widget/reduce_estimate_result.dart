import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/page/reduce_waste/constant/reduce_waste_selection_option.dart';

class ReduceEstimateResult extends HookConsumerWidget {
  final double originalTotalWeight;
  final ReduceWasteSelectionOption selectedOption;

  const ReduceEstimateResult({
    super.key,
    required this.originalTotalWeight,
    required this.selectedOption,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _EstimateResultItem(
          hints: 'Last dispensed',
          totalWeight: originalTotalWeight,
          colorWeight: 30.0,
          developerWeight: 30.0,
        ),
        if (selectedOption != ReduceWasteSelectionOption.none)
          _EstimateResultItem(
            hints: 'New Total',
            totalWeight:
                originalTotalWeight - selectedOption.selectedReduceAmount,
            colorWeight:
                (originalTotalWeight - selectedOption.selectedReduceAmount) / 2,
            developerWeight:
                (originalTotalWeight - selectedOption.selectedReduceAmount) / 2,
          ),
      ],
    );
  }
}

// TODO: ask what it is and what is the difference between colorWeight and developerWeight
// TODO: ask is it just simply divide the amount of totalWeight by 2
class _EstimateResultItem extends HookConsumerWidget {
  final String hints;
  final double totalWeight;
  final double colorWeight;
  final double developerWeight;

  const _EstimateResultItem({
    required this.hints,
    required this.totalWeight,
    required this.colorWeight,
    required this.developerWeight,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(
          hints,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 19.0,
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.47),
          ),
        ),
        const SizedBox(
          height: 19.25,
        ),
        Container(
          width: 206.8,
          height: 156.17,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(28.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${totalWeight.toStringAsFixed(0)}g',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 46.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Text(
                '(${colorWeight.toStringAsFixed(0)}g C + ${developerWeight.toStringAsFixed(0)}g D)',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.25),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
