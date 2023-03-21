import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yuv_quiz/src/domain/color_card/store/color_card_provider.dart';
import 'package:yuv_quiz/src/domain/reduce_waste/store/reduce_waste_provider.dart';
import 'package:yuv_quiz/src/page/color_card/widget/client_record.dart';
import 'package:yuv_quiz/src/page/color_card/widget/overview_item.dart';
import 'package:yuv_quiz/src/page/reduce_waste/constant/reduce_waste_selection_option.dart';

class OverviewContent extends HookConsumerWidget {
  const OverviewContent({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorWeight = ref.watch(colourWeightProvider);
    final selectedWeight = ref.watch(selectedReduceAmountProvider);

    final formulaValue = useMemoized(() {
      final calculatedValue = colorWeight / 2;
      if ((calculatedValue % 1) == 0) {
        return calculatedValue.toStringAsFixed(0);
      } else {
        return calculatedValue.toStringAsFixed(1);
      }
    }, [colorWeight, selectedWeight]);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 50.0,
            bottom: 70.0,
          ),
          child: ClientRecord(),
        ),
        Divider(
          color: const Color(0xFF707070).withOpacity(0.16),
          thickness: 1.0,
        ),
        OverViewItem(
          imagePath: 'assets/images/bowl.png',
          title: '${formulaValue}g colour + ${formulaValue}g developer colour',
          description: '1/2 Tube + Developer',
          subtitle: '(${colorWeight.toStringAsFixed(0)}g)',
          subDescription: selectedWeight != ReduceWasteSelectionOption.none
              ? 'adjusted'
              : null,
        ),
        const OverViewItem(
          imagePath: 'assets/images/device_plain.png',
          titleImagePath: 'assets/images/yuv_logo.png',
          titleImageWidth: 70.0,
          titleImageHeight: 20.0,
          title: 'lab',
          description: 'Select a yuv lab device',
        ),
        const OverViewItem(
          imagePath: 'assets/images/printer.png',
          title: 'Printer',
          description: 'Printer not selected',
        ),
      ],
    );
  }
}
