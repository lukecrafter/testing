import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/page/reduce_waste/constant/reduce_waste_selection_option.dart';
import 'package:yuv_quiz/src/page/reduce_waste/helper/reduce_waste_helper.dart';
import 'package:yuv_quiz/src/shared/widget/filter_selection_button.dart';

class ReduceWasteSelection extends HookConsumerWidget {
  final ReduceWasteSelectionOption selectedOption;
  final double? remainingWeight;
  final void Function(ReduceWasteSelectionOption) onOptionSelected;

  const ReduceWasteSelection({
    super.key,
    required this.selectedOption,
    required this.onOptionSelected,
    required this.remainingWeight,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final optionShowRecommendTag = useMemoized(() {
      if (remainingWeight == null) {
        return null;
      }

      return ReduceWasteHelper.isShowRecommendTag(
        remainingWeight: remainingWeight!,
      );
    }, [remainingWeight]);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 79.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final option in ReduceWasteSelectionOption.values) ...[
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilterSelectionButton(
                    onPressed: () => onOptionSelected(option),
                    isSelected: selectedOption == option,
                    text: option.selectedReduceAmountString,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                      vertical: 11.0,
                    ),
                  ),
                  if (optionShowRecommendTag == option) ...[
                    const SizedBox(height: 14.2),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF9DFF90),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 7.2),
                      child: Text(
                        'Recommended',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.spaceGrotesk(
                          color: const Color(0xFF006C16),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }
}
