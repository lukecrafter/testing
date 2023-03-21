import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/domain/reduce_waste/store/reduce_waste_provider.dart';
import 'package:yuv_quiz/src/page/reduce_waste/constant/reduce_waste_selection_option.dart';
import 'package:yuv_quiz/src/shared/theme/theme_color.dart';
import 'package:yuv_quiz/src/shared/widget/action_button.dart';

class ReduceWasteActionRow extends HookConsumerWidget {
  final ReduceWasteSelectionOption selectedOption;
  final double? weighResult;
  final VoidCallback leftButtonOnPressed;

  const ReduceWasteActionRow({
    super.key,
    required this.selectedOption,
    this.weighResult,
    required this.leftButtonOnPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leftButtonText = useMemoized(() {
      return weighResult == null ? 'Weigh bowl' : 'Weigh bowl again';
    }, [weighResult]);

    final rightButtonText = useMemoized(() {
      return selectedOption == ReduceWasteSelectionOption.none
          ? 'Continue'
          : 'Adjust quantity';
    }, [selectedOption]);

    final rightButtonColor = useMemoized(() {
      return selectedOption == ReduceWasteSelectionOption.none
          ? Colors.black
          : ThemeColor.adjustedColor;
    }, [selectedOption]);

    final rightButtonTextColor = useMemoized(() {
      return selectedOption == ReduceWasteSelectionOption.none
          ? Colors.white
          : Colors.black;
    }, [selectedOption]);

    final rightButtonOnPressed = useCallback(() {
      ref.read(selectedReduceAmountProvider.notifier).state = selectedOption;

      Navigator.of(context).pop();
    }, [selectedOption]);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                'Calculate your exact wastage',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 16.0,
                  color: Colors.black.withOpacity(
                    0.42,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ActionButton(
                text: leftButtonText,
                borderColor: const Color(0xFF707070),
                backgroundColor: Colors.white,
                textColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 26.8),
                onPressed: leftButtonOnPressed,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 27.0,
        ),
        Expanded(
          child: Column(
            children: [
              ActionButton(
                text: rightButtonText,
                borderColor: rightButtonColor,
                backgroundColor: rightButtonColor,
                textColor: rightButtonTextColor,
                padding: const EdgeInsets.symmetric(vertical: 26.8),
                onPressed: rightButtonOnPressed,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
